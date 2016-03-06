function process()
{
  var url="http://localhost:3000/search/" + document.getElementById("semester").value + "/" + document.getElementById("department").value; // Will be changed when pushed to heroku
  if (document.getElementById("coursenum").value != null) {
    url += "/" + document.getElementById("coursenum").value;
  }
  var tempSemester = document.getElementById('semester').value;
  
  var tempDepartment = document.getElementById('department').value;
  
  
  location.href=url;
  
  var semesterSelect =  document.getElementById('semester');
  var departmentSelect = document.getElementById('department');
  
  for (var i, j=0; i = semesterSelect.options[j]; j++) {
    if (i.value == tempSemester) {
      semesterSelect.selectedIndex = j;
      break;
    }
  }
  
  for (var i, j=0; i = departmentSelect.options[j]; j++) {
    if (i.value == tempDepartment) {
      departmentSelect.selectedIndex = j;
      break;
    }
  }
  return false;
}
