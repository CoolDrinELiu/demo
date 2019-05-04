// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require EasyAutocomplete-1.3.5/jquery.easy-autocomplete.min.js


$(function(){
  $(document).on("click", "#tijiao", function(){
      var name_value = $("#name").val();
      var phone_value = $("#phone").val();
      $.ajax({
        url: '/signup_event',
        type: 'POST',
        dataType: "json",
        data: {
          'name': name_value,
          'phone': phone_value
        },
        success: function(response){
          if(response.result === true){
            alert(response.msg);
            location.reload([false]);
            // window.location.href="http://192.168.5.199:3000"
            // dangqian url window.location.href;
          }else{
            alert(response.msg);
          }
        }
      })

      return false;
  });

//       var options = {
//          data: [
//             " Cyclops","Professor","Mystique","Magneto","Storm","Wolverine"
//          ]
//        };
//        $("#inputOne").easyAutocomplete(options);


  var options = {
	  url: function(phrase) {
		  return "/beijing?phrase=" + phrase;
  	},
    getValue:"name",
    list: {
    	onClickEvent: function() {
        var value = $("#inputOne").getSelectedItemData().id;
        self.location='/users/'+ value;
    	}
    }
  };

  $("#inputOne").easyAutocomplete(options);

  // var options = {
  //     url: "beijing.json",
  //     getValue: function(element) {
  //         return element.character;
  //     },
  //     list: {
  //     		onClickEvent: function() {
  //     		  self.location='http://0.0.0.0:3000/signin';
  //     		}
  //     	}
  // };
  //
  // $("#inputOne").easyAutocomplete(options);
})

  //
  //
  // $(function () {
  //   $('.form-control').on('input propertychange', function(){
  //     var neirong = $(this).val();
  //     $.ajax({
  //       url: '/rua',
  //       type: 'GET',
  //       dataType: "json",z
  //       data: {
  //         "neirong":neirong
  //       },
  //     })
  //   })
  // });
