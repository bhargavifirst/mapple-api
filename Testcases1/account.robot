**** settings ****
Library  RequestsLibrary
Library    String
Library   Collections
Library    DateTime
Library    Dialogs
Library    XML

***** Variables ***

${base_url}  https://qapiv1.maplerecord.com/api
**** Test Cases ***
list_request
      Create Session      url   ${base_url}
      ${body} =  create dictionary
       ${header} =  create dictionary  Content-Type=application/json
       ${response} =  post request  url   /account/list     data=${body}  headers=${header}
    Log To Console   ${response.status_code}
    Log To Console    ${response.content}
      #validation
   ${status_code}=  convert to string   ${response.status_code}
    should be equal  ${status_code}    200
add_request
    Create Session      url   ${base_url}
     ${body} =  create dictionary   firstName=aashvi  lastName=siddineni   employeeId=1002   email=user3@gmail.com  userName=2mapple  phoneNumber=5795010089    departmentId=1    designationId=1   $.isDepartmentHead=true
     ${header} =  create dictionary  Content-Type=application/json
     ${response} =  post request  url   /account/add  data=${body}  headers=${header}
     Log To Console   ${response.status_code}
        Log To Console    ${response.content}

     #validation
   ${status_code}=  convert to string   ${response.status_code}
    should be equal  ${status_code}    200

update_request
    Create Session      url   ${base_url}
    ${body} =  create dictionary       firstName=sahiti  lastName=siddinenis   employeeId=1007   email=user@gmail.com  userName=mapple  phoneNumber=7795019486    departmentId=1    designationId=1  $.isDepartmentHead=true   id=9ccbda9c-c772-4f69-9e95-5e76e83c12b0
       ${header} =  create dictionary  Content-Type=application/json
       ${response} =  post request  url   /account/update    data=${body}  headers=${header}


      Log To Console   ${response.status_code}
      Log To Console    ${response.content}

     #validation
   ${status_code}=  convert to string   ${response.status_code}
    should be equal  ${status_code}    200

delete_request
   Create Session      url   ${base_url}
    ${response} =  post request  url   /account/delete?Id=9ccbda9c-c772-4f69-9e95-5e76e83c12b0
      Log To Console   ${response.status_code}
    Log To Console    ${response.content}

    #validation
   ${status_code}=  convert to string   ${response.status_code}
    should be equal  ${status_code}    200
