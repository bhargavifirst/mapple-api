**** settings ****
Library  RequestsLibrary
Library    String
Library   Collections
Library    DateTime
Library    XML

Library  OperatingSystem
***** Variables ***

${base_url}  https://qapiv1.maplerecord.com/api
**** Test Cases ***
post_request
    Create Session      mysession   ${base_url}
     ${body} =  create dictionary      subjectName=sahiti22  functionId=1  format=letters
    ${header} =  create dictionary  Content-Type=application/json
     ${response} =  post request  mysession   /subjects/add  data=${body}  headers=${header}
    Log To Console   ${response.status_code}
    Log To Console    ${response.content}

    #validation
   ${status_code}=  convert to string   ${response.status_code}
    should be equal  ${status_code}    200



