var personnel_card_id;

 function personnelCardStep(){
    try {
        $('#savePersonnelCardBtn').on('click', function () {
            var mainStep = $("#step1");
            var nameSurname = mainStep.find('#nameSurname').val(),
                department = mainStep.find('#department').val(),
                title = mainStep.find('#title').val(),
                phone = mainStep.find('#phone').val(),
                email = mainStep.find('#email').val(),
                birthDate = mainStep.find('#birthDate').val(),
                start_date = mainStep.find('#start_date').val(),
                education = mainStep.find('#education').val(),
                bankName = mainStep.find('#bankName').val(),
                bankIban = mainStep.find('#bankIban').val(),
                salary = mainStep.find('#salary').val(),
                description = mainStep.find('#note').val();

             if (nameSurname == "" || department == "" || title == "" || phone == "" || email == ""  || education == "" || bankName == "" || bankIban == "" || salary == "") {
                Swal.fire('Hatalı', 'Lütfen Bütün Boşlukları Doldurun!', 'error').then(function(){ });
            }

            else{
                $("#next-step").trigger("click");
                $(".name-surname").text(nameSurname);
                $(".department").text(department);
                $(".title").text(title);
                $(".phone-number").text(phone);
                $(".email").text(email);
                $(".birth-date").text(birthDate);
                $(".start-date").text(start_date);
                $(".education").text(education);
                $(".bank-name").text(bankName);
                $(".bank-iban").text(bankIban);
                $(".salary").text(salary);
                $(".description").text(description);
            }
        });
    } catch (error) {
        console.log(error);
    }
}


"use strict";

// Class Definition
var AddUser = function () {
	// Private Variables
	var _wizardEl;
	var _formEl;
	var _wizardObj;
    var _avatar;
	var _validations = [];

	// Private Functions
	var _initWizard = function () {
		// Initialize form wizard
		_wizardObj = new KTWizard(_wizardEl, {
			startStep: 1, // initial active step number
			clickableSteps: false  // allow step clicking
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
					if (status == 'Valid') {
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

        if(jQuery('#completePersonnelCard').click) {

            // Submit event
            $("#completePersonnelCard").on('click', function (wizard) {
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
                        var nameSurname = mainStep.find('#nameSurname').val(),
                            department  = mainStep.find('#department').val(),
                            title       = mainStep.find('#title').val(),
                            phone       = mainStep.find('#phone').val(),
                            email       = mainStep.find('#email').val(),
                            birthDate   = mainStep.find('#birthDate').val(),
                            start_date  = mainStep.find('#start_date').val(),
                            education   = mainStep.find('#education').val(),
                            bankName    = mainStep.find('#bankName').val(),
                            bankIban    = mainStep.find('#bankIban').val(),
                            salary      = mainStep.find('#salary').val(),
                            note        = mainStep.find('#note').val();

                       addPersonnelCard(nameSurname, department, title, phone, email, birthDate, start_date, education, bankName, bankIban, salary, note)

                        $("#dropzone").find("#prId").val(personnel_card_id);
                    }, 1000);
                    //send Payement Request
                    function addPersonnelCard(nameSurname, department, title,phone,email, birthDate, start_date, education, bankName, bankIban, salary, note){
                        try {
                            $.ajaxSetup({
                                headers: {
                                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                                }
                            });
                            $.ajax({
                                url: '/humanresource/personnelcard/store',
                                type: 'POST',
                                data: {
                                    'nameSurname': nameSurname,
                                    'department': department,
                                    'title': title,
                                    'phone': phone,
                                    'email': email,
                                    'birthDate': birthDate,
                                    'start_date': start_date,
                                    'education': education,
                                    'bankName':bankName ,
                                    'bankIban': bankIban,
                                    'salary': salary,
                                    'note': note
                                },
                                async: false,
                                dataType: 'json',
                                success: function (response) {
                                    if (response) {
                                        setTimeout(() => {
                                            myDropzone.processQueue();
                                            Swal.fire('Başarılı', 'Personel Kartı Başarıyla Oluşturuldu!', 'success').then(function(){
                                                location.reload();
                                            });
                                        }, 1000);
                                        personnel_card_id=response;
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

	var _initValidations = function () {
		// Init form validation rules. For more info check the FormValidation plugin's official documentation:https://formvalidation.io/

		// Validation Rules For Step 1
		_validations.push(FormValidation.formValidation(
			_formEl,
			{
				fields: {
					nameSurname: {
						validators: {
							notEmpty: {
								message: 'Ad Soyad Gerekli'
							}
						}
					},
					department: {
						validators: {
							notEmpty: {
								message: 'Departman Gerekli'
							}
						}
					},
					title: {
						validators: {
							notEmpty: {
								message: 'Görev Gerekli'
							}
						}
					},
					phone: {
						validators: {
							notEmpty: {
								message: 'Telefon Numarası Gerekli'
							},
							phone: {
								country: 'US',
								message: 'Telefon Numarası Geçerli Değil. (5554443333)'
							}
						}
					},
					email: {
						validators: {
							notEmpty: {
								message: 'E-mail Gerekli'
							},
							emailAddress: {
								message: 'E-mail Geçerli Değil'
							}
						}
					},
					birthDate: {
						validators: {
							notEmpty: {
								message: 'Doğum Tarihi Gerekli'
							}
						}
					},
					education: {
						validators: {
							notEmpty: {
								message: 'Eğitim Gerekli'
							}
						}
					},
					bankName: {
						validators: {
							notEmpty: {
								message: 'Banka Adı Gerekli'
							}
						}
					},
					bankIban: {
						validators: {
							notEmpty: {
								message: 'Banka İbanı Gerekli'
							}
						}
					},
					salary: {
						validators: {
							notEmpty: {
								message: 'Aylık Maaş Gerekli'
							}
						}
					}
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
			_wizardEl = KTUtil.getById('wizard2');
			_formEl = KTUtil.getById('step1');

			_initWizard();
			_initValidations();
		}
	};
}();

jQuery(document).ready(function () {
	AddUser.init();
});
