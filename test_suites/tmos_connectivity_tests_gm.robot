*** Settings ***
Resource    /home/robot/git/robotframework-f5networks/F5NetworksTMOSiControl.robot

*** Variables ***
${BIGIP_PRIMARY_MGMT_IP}    192.168.2.91
#${BIGIP_SECONDARY_MGMT_IP}    %{BIGIP_SECONDARY_MGMT_IP}
${SSH_USERNAME}    root
${SSH_PASSWORD}    default
${HTTP_USERNAME}    admin
${HTTP_PASSWORD}    admin
${HTTP_RESPONSE_OK}    200
#${HTTP_RESPONSE_NOT_FOUND}    %{HTTP_RESPONSE_NOT_FOUND}

*** Test Cases ***
Verify SSH Connectivity
    Set Log Level    trace
    Wait until Keyword Succeeds    3x    5 seconds    Open Connection    ${BIGIP_PRIMARY_MGMT_IP}
    Log In    ${SSH_USERNAME}    ${SSH_PASSWORD}
    Run BASH Echo Test
    Close All Connections
    # Return from Keyword If    '${BIGIP_SECONDARY_MGMT_IP}' == 'false'
    # Wait until Keyword Succeeds    3x    5 seconds    Open Connection    ${BIGIP_SECONDARY_MGMT_IP}
    # Log In    ${SSH_USERNAME}    ${SSH_PASSWORD}
    # Run BASH Echo Test
    # Close All Connections

Test BIG-IP Web UI Connectivity
    Set Log Level    trace
    Wait until Keyword Succeeds    3x    5 seconds    Retrieve BIG-IP Login Page   bigip_host=${BIGIP_PRIMARY_MGMT_IP}
    #Return from Keyword If    '${BIGIP_SECONDARY_MGMT_IP}' == 'false'
    #Wait until Keyword Succeeds    3x    5 seconds    Retrieve BIG-IP Login Page   bigip_host=${BIGIP_SECONDARY_MGMT_IP}

Test IPv4 iControlREST API Connectivity
    Set Log Level    trace
    Wait until Keyword Succeeds    3x    5 seconds    Retrieve BIG-IP Version    bigip_host=${BIGIP_PRIMARY_MGMT_IP}    bigip_username=${HTTP_USERNAME}    bigip_password=${HTTP_PASSWORD}
    #Return from Keyword If    '${BIGIP_SECONDARY_MGMT_IP}' == 'false'
    #Wait until Keyword Succeeds    3x    5 seconds    Retrieve BIG-IP Version    bigip_host=${BIGIP_SECONDARY_MGMT_IP}    bigip_username=${HTTP_USERNAME}    bigip_password=${HTTP_PASSWORD}

Test IPv4 iControlREST Token Authentication
    Set Log Level    trace
    Retrieve BIG-IP Version using Token Authentication    bigip_host=${BIGIP_PRIMARY_MGMT_IP}    bigip_username=${HTTP_USERNAME}    bigip_password=${HTTP_PASSWORD}
    #Return from Keyword If    '${BIGIP_SECONDARY_MGMT_IP}' == 'false'
    #Retrieve BIG-IP Version using Token Authentication    bigip_host=${BIGIP_SECONDARY_MGMT_IP}    bigip_username=${HTTP_USERNAME}    bigip_password=${HTTP_PASSWORD}
