
 <div class="col-xl-12">
    <div class="card card-custom gutter-b"">
       <div class="card-body">
          <ul class="dashboard-tabs nav nav-pills nav-danger row row-paddingless m-0 p-0 flex-column flex-sm-row" role="tablist">
             <div class="row">
             @can('istenen ödeme talebini göster')
             <div class="col-xl-4">
                <div class="card card-custom card-stretch">
                   <div class="card-body d-flex p-0">
                      <div class="flex-grow-1 p-8 card-rounded bg-danger bgi-no-repeat d-flex align-items-center" style="background-position: left bottom; background-size: auto 100%; background-image: url(/metronic/theme/html/demo10/dist/assets/media/svg/humans/custom-2.svg)">
                         <div class="row">
                            <div class="col-12 col-xl-12">
                               <h4 class="text-white">Cevaplanmayan Satın Alma Talepleri</h4>
                               <p class="text-white-50 my-5 font-size-xl font-weight-bold">
                                  <span class="nav-icon py-2 w-auto">
                                     <span class="svg-icon svg-icon-3x">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                           <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                              <rect x="0" y="0" width="24" height="24"></rect>
                                              <path d="M12,22 C7.02943725,22 3,17.9705627 3,13 C3,8.02943725 7.02943725,4 12,4 C16.9705627,4 21,8.02943725 21,13 C21,17.9705627 16.9705627,22 12,22 Z" fill="#000000" opacity="0.3"></path>
                                              <path d="M11.9630156,7.5 L12.0475062,7.5 C12.3043819,7.5 12.5194647,7.69464724 12.5450248,7.95024814 L13,12.5 L16.2480695,14.3560397 C16.403857,14.4450611 16.5,14.6107328 16.5,14.7901613 L16.5,15 C16.5,15.2109164 16.3290185,15.3818979 16.1181021,15.3818979 C16.0841582,15.3818979 16.0503659,15.3773725 16.0176181,15.3684413 L11.3986612,14.1087258 C11.1672824,14.0456225 11.0132986,13.8271186 11.0316926,13.5879956 L11.4644883,7.96165175 C11.4845267,7.70115317 11.7017474,7.5 11.9630156,7.5 Z" fill="#000000"></path>
                                           </g>
                                        </svg>
                                     </span>
                                  </span>
                               </p>
                               <a href="{{ route('purchasingrequests.requested',['startDate'=>date("Y-m-d"),'endDate'=>date("Y-m-d"),'']);}}" class="btn btn-dark font-weight-bold py-2 px-6">Görüntüle</a>
                            </div>
                         </div>
                      </div>
                   </div>
                </div>
             </div>
             @endcan
             @can('bekleyen ödeme talebini göster')
             <div class="col-xl-4">
                <div class="card card-custom card-stretch">
                   <div class="card-body d-flex p-0">
                      <div class="flex-grow-1 p-8 card-rounded bg-warning bgi-no-repeat d-flex align-items-center" style="background-position: left bottom; background-size: auto 100%; background-image: url(/metronic/theme/html/demo10/dist/assets/media/svg/humans/custom-2.svg)">
                         <div class="row">
                            <div class="col-12 col-xl-12">
                               <h4 class="text-white">Onaya Gönderilen Satın Alma Talepleri</h4>
                               <p class="text-white-50 my-5 font-size-xl font-weight-bold">
                                  <span class="nav-icon py-2 w-auto">
                                     <span class="svg-icon svg-icon-3x">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                           <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                              <rect x="0" y="0" width="24" height="24"></rect>
                                              <path d="M19.5,10.5 L21,10.5 C21.8284271,10.5 22.5,11.1715729 22.5,12 C22.5,12.8284271 21.8284271,13.5 21,13.5 L19.5,13.5 C18.6715729,13.5 18,12.8284271 18,12 C18,11.1715729 18.6715729,10.5 19.5,10.5 Z M16.0606602,5.87132034 L17.1213203,4.81066017 C17.7071068,4.22487373 18.6568542,4.22487373 19.2426407,4.81066017 C19.8284271,5.39644661 19.8284271,6.34619408 19.2426407,6.93198052 L18.1819805,7.99264069 C17.5961941,8.57842712 16.6464466,8.57842712 16.0606602,7.99264069 C15.4748737,7.40685425 15.4748737,6.45710678 16.0606602,5.87132034 Z M16.0606602,18.1819805 C15.4748737,17.5961941 15.4748737,16.6464466 16.0606602,16.0606602 C16.6464466,15.4748737 17.5961941,15.4748737 18.1819805,16.0606602 L19.2426407,17.1213203 C19.8284271,17.7071068 19.8284271,18.6568542 19.2426407,19.2426407 C18.6568542,19.8284271 17.7071068,19.8284271 17.1213203,19.2426407 L16.0606602,18.1819805 Z M3,10.5 L4.5,10.5 C5.32842712,10.5 6,11.1715729 6,12 C6,12.8284271 5.32842712,13.5 4.5,13.5 L3,13.5 C2.17157288,13.5 1.5,12.8284271 1.5,12 C1.5,11.1715729 2.17157288,10.5 3,10.5 Z M12,1.5 C12.8284271,1.5 13.5,2.17157288 13.5,3 L13.5,4.5 C13.5,5.32842712 12.8284271,6 12,6 C11.1715729,6 10.5,5.32842712 10.5,4.5 L10.5,3 C10.5,2.17157288 11.1715729,1.5 12,1.5 Z M12,18 C12.8284271,18 13.5,18.6715729 13.5,19.5 L13.5,21 C13.5,21.8284271 12.8284271,22.5 12,22.5 C11.1715729,22.5 10.5,21.8284271 10.5,21 L10.5,19.5 C10.5,18.6715729 11.1715729,18 12,18 Z M4.81066017,4.81066017 C5.39644661,4.22487373 6.34619408,4.22487373 6.93198052,4.81066017 L7.99264069,5.87132034 C8.57842712,6.45710678 8.57842712,7.40685425 7.99264069,7.99264069 C7.40685425,8.57842712 6.45710678,8.57842712 5.87132034,7.99264069 L4.81066017,6.93198052 C4.22487373,6.34619408 4.22487373,5.39644661 4.81066017,4.81066017 Z M4.81066017,19.2426407 C4.22487373,18.6568542 4.22487373,17.7071068 4.81066017,17.1213203 L5.87132034,16.0606602 C6.45710678,15.4748737 7.40685425,15.4748737 7.99264069,16.0606602 C8.57842712,16.6464466 8.57842712,17.5961941 7.99264069,18.1819805 L6.93198052,19.2426407 C6.34619408,19.8284271 5.39644661,19.8284271 4.81066017,19.2426407 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                                           </g>
                                        </svg>
                                     </span>
                                  </span>
                               </p>
                               <a href="{{ route('purchasingrequests.waiting',['startDate'=>date("Y-m-d"),'endDate'=>date("Y-m-d"),'']); }}" class="btn btn-dark font-weight-bold py-2 px-6">Görüntüle</a>
                            </div>
                         </div>
                      </div>
                   </div>
                </div>
             </div>
             @endcan
             @can('tamamlanan ödeme talebini göster')
             <div class="col-xl-4">
                <div class="card card-custom card-stretch">
                   <div class="card-body d-flex p-0">
                      <div class="flex-grow-1 p-8 card-rounded bg-success bgi-no-repeat d-flex align-items-center" style="background-position: left bottom; background-size: auto 100%; background-image: url(/metronic/theme/html/demo10/dist/assets/media/svg/humans/custom-2.svg)">
                         <div class="row">
                            <div class="col-12 col-xl-12">
                               <h4 class="text-white">Tamamlanan Satın Alma Talepleri</h4>
                               <p class="text-white-50 my-5 font-size-xl font-weight-bold">
                                  <span class="nav-icon py-2 w-auto">
                                     <span class="svg-icon svg-icon-3x">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                           <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                              <polygon points="0 0 24 0 24 24 0 24"></polygon>
                                              <path d="M9.26193932,16.6476484 C8.90425297,17.0684559 8.27315905,17.1196257 7.85235158,16.7619393 C7.43154411,16.404253 7.38037434,15.773159 7.73806068,15.3523516 L16.2380607,5.35235158 C16.6013618,4.92493855 17.2451015,4.87991302 17.6643638,5.25259068 L22.1643638,9.25259068 C22.5771466,9.6195087 22.6143273,10.2515811 22.2474093,10.6643638 C21.8804913,11.0771466 21.2484189,11.1143273 20.8356362,10.7474093 L17.0997854,7.42665306 L9.26193932,16.6476484 Z" fill="#000000" fill-rule="nonzero" opacity="0.3" transform="translate(14.999995, 11.000002) rotate(-180.000000) translate(-14.999995, -11.000002) "></path>
                                              <path d="M4.26193932,17.6476484 C3.90425297,18.0684559 3.27315905,18.1196257 2.85235158,17.7619393 C2.43154411,17.404253 2.38037434,16.773159 2.73806068,16.3523516 L11.2380607,6.35235158 C11.6013618,5.92493855 12.2451015,5.87991302 12.6643638,6.25259068 L17.1643638,10.2525907 C17.5771466,10.6195087 17.6143273,11.2515811 17.2474093,11.6643638 C16.8804913,12.0771466 16.2484189,12.1143273 15.8356362,11.7474093 L12.0997854,8.42665306 L4.26193932,17.6476484 Z" fill="#000000" fill-rule="nonzero" transform="translate(9.999995, 12.000002) rotate(-180.000000) translate(-9.999995, -12.000002) "></path>
                                           </g>
                                        </svg>
                                     </span>
                                  </span>
                               </p>
                               <a href="{{ route('purchasingrequests.completed',['startDate'=>date("Y-m-d"),'endDate'=>date("Y-m-d"),'']);}}" class="btn btn-dark font-weight-bold py-2 px-6">Görüntüle</a>
                            </div>
                         </div>
                      </div>
                   </div>
                </div>
             </div>
             @endcan
          </div>
          </ul>
       </div>
    </div>
 </div>
