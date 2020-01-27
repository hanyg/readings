<html>
  % include("header.tpl")
  % include("navbar.tpl")

  <body>
      <div class="container">
        <div class="row">
          <div class="col">
            <h1>Readings</h1>
            <table class="table table-bordered table-striped">
                 <thead>
                     <tr>
                        <th>Systolic</th>
                        <th>Diastolic</th>
                        <th>Heart Rate</th>
			<th>Date / Time</th>
			<th>Notes</th>
			<th></th>
                     </tr>
                 </thead>
                 <tbody>
                 %for row in c:
                   <tr>
                      <td>{{row['systolic']}}</td>
                      <td>{{row['diastolic']}}</td>
                      <td>{{row['heartrate']}}</td>
                      <td>{{row['date']}}</td>
                      <td>{{row['notes']}}</td>
                      <td><a href="/delete/{{row['rowid']}}"><i class="fa fa-trash" aria-hidden="true"></i></a> <a href="/edit/{{row['rowid']}}"><i class="fa fa-pencil"></i></a></td>
                   </tr>
                 %end
                 </tbody>
            </table>

            <a href="/add" class="btn btn-primary" >Add Reading</a>

          </div>
        </div>
     </div>

  % include("footer.tpl")

  </body>



</html>
