

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
            if(jQuery('#completePurchasingRequest').click) {

                // Submit event
                $("#completePurchasingRequest").on('click', function (wizard) {

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
                        },
                    }).then(function (result) {
                        if (result.value) {
                        //payment request
                            setTimeout(() => {
                                var mainStep = $("#step1");
                                var productTitle    = mainStep.find('#productTitle').val(),
                                    productUrl      = mainStep.find('#productUrl').val(),
                                    note            = mainStep.find('#note').val();
                                addPurchasingRequest(productTitle, productUrl, note )

                                $("#dropzone").find("#prId").val(purchasing_request_id);
                            }, 1000);
                        //send Purchasing Request
                        function addPurchasingRequest(productTitle, productUrl, note){
                            try {
                                $.ajaxSetup({
                                    headers: {
                                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                                    }
                                });
                                $.ajax({
                                    url: '/purchasingrequests/store',
                                    type: 'POST',
                                    data: {
                                        'productTitle': productTitle,
                                        'productUrl': productUrl,
                                        'note': note,
                                    },
                                    async: false,
                                    dataType: 'json',
                                    success: function (response) {
                                        if (response) {
                                            setTimeout(() => {
                                                Swal.fire('Başarılı', 'Satın Alma Talebi Başarıyla Oluşturuldu!', 'success').then(function(){
                                                    location.reload();
                                                });
                                            }, 1000);
                                            purchasing_request_id = response;
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
     }
     var _initValidation = function () {
        // Init form validation rules. For more info check the FormValidation plugin's official documentation:https://formvalidation.io/
        // Step 1
        _validations.push(FormValidation.formValidation(
            _formEl,
             {
                 fields: {
                     productTitle: {
                         validators: {
                             notEmpty: {
                                 message: 'Ürün başlığı gerekli'
                             }
                         }
                     },
                     productUrl: {
                         validators: {
                             notEmpty: {
                                 message: 'Ürün URL gerekli'
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
