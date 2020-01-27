<html>
  % include("header.tpl")
  % include("navbar.tpl")


  <body>
      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <h1>Add Reading</h1>

            <form action="/add" method="post">
               <div class="form-group">
                 <label for="systolic">Systolic</label>
                 <input id="systolic" name="systolic" type="text" class="form-control" placeholder="Enter a reading" required />
               </div>
               <div class="form-group">
                 <label for="diastolic">Diastolic</label>
                 <input id="diastolic" name="diastolic" type="text" class="form-control" placeholder="Enter a reading" required />
               </div>
               <div class="form-group">
                 <label for="heartrate">Heart Rate</label>
                 <input id="heartrate" name="heartrate" type="text" class="form-control" placeholder="Enter a reading" required />
               </div>
               <div class="form-group">
                 <label for="datetime">Date / Time</label>
                 <div class="input-group date" id="datetimepickgrp" data-target-input="nearest">
                    <input type="text" id="datetime" name="datetime" class="form-control datetimepicker" data-target="#datetimepickgrp" placeholder="Enter the date and time" required />
                    <div class="input-group-append" data-target="#datetimepickgrp" data-toggle="datetimepicker">
                        <span class="input-group-text datetimepicker-addon" data-target="#datetimepickgrp"><i class="fa fa-calendar"></i></span>
                    </div>
                 </div>
               </div>
               <div class="form-group">
                 <label for="notes">Notes</label>
                 <input id="notes" name="notes" type="text" class="form-control" placeholder="Enter notes (optional)" required />
               </div>
               <a href="/readings" class="btn btn-primary float-left btn-sm btn-block" >Cancel</a>
               <input value="Add" type="submit" class="btn btn-primary float-right btn-sm btn-block"/>
           </form>
 


          </div>
        </div>
     </div>

  % include("footer.tpl")

<script type="text/javascript">
jQuery(document).ready(function($) {
    if (window.jQuery().datetimepicker) {
        $('.datetimepicker').datetimepicker({
            // Formats
            // follow MomentJS docs: https://momentjs.com/docs/#/displaying/format/
            format: 'DD-MM-YYYY hh:mm A',

            allowInputToggle: true,
            
            // Your Icons
            // as Bootstrap 4 is not using Glyphicons anymore
            icons: {
                time: 'fa fa-clock-o',
                date: 'fa fa-calendar',
                up: 'fa fa-chevron-up',
                down: 'fa fa-chevron-down',
                previous: 'fa fa-chevron-left',
                next: 'fa fa-chevron-right',
                today: 'fa fa-check',
                clear: 'fa fa-trash',
                close: 'fa fa-times'
            }
        });

        $('.datetimepicker-addon').on('click', function() {
        	$(this).prev('input.datetimepicker').data('DateTimePicker').toggle();
        });
    }
});
</script>

  </body>



</html>
