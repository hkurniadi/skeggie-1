function process()
{
  var getUrl = window.location;
  var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
  var url= baseUrl + "/" + document.getElementById("semester").value + "/" + document.getElementById("department").value;
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
