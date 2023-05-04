

 //---------------- wizard --------------------------

 "use strict";

 // Class definition
 var KTWizard2 = function () {
     // Base elements
     var _wizardEl;
     var _formEl;
     var _wizardObj;
     var _validations = [];

     // Private functions
     var _initWizard = function () {
         // Initialize form wizard
         _wizardObj = new KTWizard(_wizardEl, {
             startStep: 1, // initial active step number
             clickableSteps: false // to make steps clickable this set value true and add data-wizard-clickable="true" in HTML for class="wizard" element
         });

         // Validation before going to next page
         _wizardObj.on('change', function (wizard) {
             if (wizard.getStep() > wizard.getNewStep()) {
                 return; // Skip if stepped back
             }

             // Validate form before change wizard step
             var validator = _validations[wizard.getStep() - 1]; // get validator for currnt step

             if (validator) {
                 validator.validate().then(function (status) {
                     if (status == 'Valid' ) {
                        wizard.goTo(wizard.getNewStep());
                        KTUtil.scrollTop();
                     } else {
                         Swal.fire({
                             title:"Hatalı",
                             text: "Lütfen Bütün Boşlukları Doldurun!",
                             icon: "error",
                             buttonsStyling: false,
                             confirmButtonText: "Tamam",
                             customClass: {
                                 confirmButton: "btn font-weight-bold btn-light"
                             }
                         }).then(function () {
                             KTUtil.scrollTop();
                         });
                     }
                 });
             }

             return false;  // Do not change wizard step, further action will be handled by he validator
         });

         // Change event
         _wizardObj.on('changed', function (wizard) {
             KTUtil.scrollTop();
         });

            // Submit event
            $("#completePaymentRequest").on('click', function (wizard) {
                Swal.fire({
                    text: "Her şey yolunda! Lütfen form gönderimini onaylayınız.",
                    icon: "success",
                    showCancelButton: true,
                    buttonsStyling: false,
                    confirmButtonText: "Evet, Gönder!",
                    cancelButtonText: "Hayir, İptal",
                    customClass: {
                        confirmButton: "btn font-weight-bold btn-primary",
                        cancelButton: "btn font-weight-bold btn-default"
                    }
                }).then(function (result) {
                    if (result.value) {
                    //payment request
                    setTimeout(() => {
                        var mainStep = $("#step1");
                        var expiryDate = mainStep.find('#expiryDate').val(),
                            paymentAmount = mainStep.find('#paymentAmount').val(),
                            paymentCurrency = mainStep.find('#paymentCurrency').children("option:selected").val(),
                            paidCompanyId = mainStep.find('#paidCompanyId').children("option:selected").val(),
                            payCompanyId = mainStep.find('#payCompanyId').children("option:selected").val(),
                            categoryId = mainStep.find('#categoryId').children("option:selected").val(),
                            paymentTypeId = mainStep.find('#paymentTypeId').children("option:selected").val(),
                            documentNo = mainStep.find('#documentNo').val(),
                            documentDate = mainStep.find('#documentDate').val(),
                            invoiceDate = mainStep.find('#invoiceDate').val(),
                            note = mainStep.find('#note').val();
                        addPaymentRequest(expiryDate, paymentAmount, paymentCurrency,categoryId,payCompanyId, paidCompanyId, paymentTypeId, documentNo, documentDate, invoiceDate, note)

                        $("#dropzone").find("#prId").val(payment_request_id);
                    }, 1000);
                    //send Payement Request
                    function addPaymentRequest(expiryDate, paymentAmount, paymentCurrency, categoryId ,payCompanyId, paidCompanyId, paymentTypeId, documentNo, documentDate, invoiceDate, note){
                        try {
                            $.ajaxSetup({
                                headers: {
                                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                                }
                            });
                            $.ajax({
                                url: '/paymentrequests/store',
                                type: 'POST',
                                data: {
                                    'expiryDate': expiryDate,
                                    'paymentAmount': paymentAmount,
                                    'paymentCurrency': paymentCurrency,
                                    'payCompanyId': payCompanyId,
                                    'paidCompanyId': paidCompanyId,
                                    'categoryId': categoryId,
                                    'paymentTypeId': paymentTypeId,
                                    'documentNo': documentNo,
                                    'documentDate': documentDate,
                                    'invoiceDate': invoiceDate,
                                    'note': note
                                },
                                async: false,
                                dataType: 'json',
                                success: function (response) {
                                    if (response) {
                                        setTimeout(() => {
                                            Swal.fire('Başarılı', 'Ödeme Talebi Başarıyla Oluşturuldu!', 'success').then(function(){
                                                location.reload();
                                            });
                                        }, 1000);
                                        payment_request_id = response;
                                    }
                                },

                                error: function () { },
                            });
                        } catch (error) {
                            console.log(error);
                        } finally { }
                    }

                    } else if (result.dismiss === 'cancel') {
                        Swal.fire({
                            text: "Formunuz gönderilmedi!.",
                            icon: "error",
                            buttonsStyling: false,
                            confirmButtonText: "Tamam, anladım!",
                            customClass: {
                                confirmButton: "btn font-weight-bold btn-primary",
                            }
                        });
                    }
                });
            });
     }

     var _initValidation = function () {
         // Init form validation rules. For more info check the FormValidation plugin's official documentation:https://formvalidation.io/
         // Step 1
         _validations.push(FormValidation.formValidation(
            _formEl,
                {

                fields: {
                    expiryDate: {
                        validators: {
                            notEmpty: {
                                message: 'Vade gerekli'
                            }
                        }
                    },
                    paymentAmount: {
                        validators: {
                            notEmpty: {
                                message: 'Tutar gerekli'
                            },
                            numeric:{
                                message: 'Lütfen Doğru Tütar Giriniz'
                            }

                        }
                    },
                    paymentCurrency: {
                        validators: {
                            notEmpty: {
                                message: 'Para Birimi gerekli'
                            }
                        }
                    },
                   /* paidCompanyId: {
                        validators: {
                            notEmpty: {
                                message: 'Firma gerekli'
                            }
                        }
                    },*/
                    payCompanyId: {
                        validators: {
                           /* notEmpty: {
                                message: 'Firma gerekli'
                            },*/
                            different: {
                                compare: function () {
                                    return $("#step1").find('#paidCompanyId').children("option:selected").val();
                                },
                                message: '2 farklı şirket seçmeniz gerekiyor!'
                            }
                        }
                    },
                    /*categoryId: {
                        validators: {
                            notEmpty: {
                                message: 'Ödeme Kategorisi gerekli'
                            }
                        }
                    },*/
                    paymentTypeId: {
                        validators: {
                            notEmpty: {
                                message: 'Ödeme Türü gerekli'
                            }
                        }
                    },
                    invoiceDate: {
                        validators: {
                            notEmpty: {
                                message: 'Fatura Tarihi gerekli'
                            }
                        }
                    },/*
                    documentNo: {
                        validators: {
                            notEmpty: {
                                message: 'Belge No gerekli'
                            }
                        }
                    },*/
                    documentDate: {
                        validators: {
                            notEmpty: {
                                message: 'Belge Tarihi gerekli'
                            }
                        }
                    },
                },

                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    // Bootstrap Framework Integration
                    bootstrap: new FormValidation.plugins.Bootstrap({
                        //eleInvalidClass: '',
                        eleValidClass: '',
                    })
                }
            }

        ));


    }

     return {
         // public functions
         init: function () {
             _wizardEl = KTUtil.getById('kt_wizard');
             _formEl = KTUtil.getById('step1');

             _initWizard();
             _initValidation();
         }
     };
 }();

 jQuery(document).ready(function () {
     KTWizard2.init();
 });


 //------------------ End wizard --------------------
