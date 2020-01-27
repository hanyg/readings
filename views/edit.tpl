<html>
  % include("header.tpl")
  % include("navbar.tpl")


  <body>
      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <h1>Edit Reading</h1>

            <form action="/update" method="post">
               <div class="form-group">
                 <label for="systolic">Systolic</label>
                 <input id="systolic" name="systolic" type="text" class="form-control" value="{{row['systolic']}}" required />
               </div>
               <div class="form-group">
                 <label for="diastolic">Diastolic</label>
                 <input id="diastolic" name="diastolic" type="text" class="form-control" value="{{row['diastolic']}}" required />
               </div>
               <div class="form-group">
                 <label for="heartrate">Heart Rate</label>
                 <input id="heartrate" name="heartrate" type="text" class="form-control" value="{{row['heartrate']}}" required />
               </div>
               <div class="form-group">
                 <label for="datetime">Date / Time</label>
                 <div class="input-group date" id="datetimepickgrp" data-target-input="nearest">
                    <input type="text" id="datetime" name="datetime" class="form-control datetimepicker" data-target="#datetimepickgrp" value="{{row['date']}}" required />
                    <div class="input-group-append">
                        <span class="input-group-text" data-target="#datetimepickgrp"><i class="fa fa-calendar"></i></span>
                    </div>
                 </div>
               </div>
               <div class="form-group">
                 <label for="notes">Notes</label>
                 <input id="notes" name="notes" type="text" class="form-control" placeholder="Enter notes (optional)" required />
               </div>
               <input type="hidden" id="rowid" name="rowid" value="{{row['rowid']}}" required />
               <input value="Update" type="submit" />
           </form>
 

            <a href="/readings" class="btn btn-primary" >Cancel</a>

          </div>
        </div>
     </div>


  </body>


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
    }
});
</script>




</html>
