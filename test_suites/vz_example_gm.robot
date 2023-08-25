*** Settings ***
Resource    /home/robot/git/robot_framework/library/F5NetworksTMOSiControl.robot


*** Variables ***
${BIGIP_PRIMARY_MGMT_IP}    192.168.2.91
${SSH_USERNAME}    root
${SSH_PASSWORD}    default
${HTTP_USERNAME}    admin
${HTTP_PASSWORD}    admin
${HTTP_RESPONSE_OK}    200
#${HTTP_RESPONSE_NOT_FOUND}    %{HTTP_RESPONSE_NOT_FOUND}

*** Test Cases ***
Test Verify BIG-IP Version
    Set Log Level    trace
    Retrieve BIG-IP Version    bigip_host=${BIGIP_PRIMARY_MGMT_IP}    bigip_username=${HTTP_USERNAME}    bigip_password=${HTTP_PASSWORD}

GET Query NTP Server List
    Set Log Level    trace
    Query NTP Server List    bigip_host=${BIGIP_PRIMARY_MGMT_IP}    bigip_username=${HTTP_USERNAME}    bigip_password=${HTTP_PASSWORD}

