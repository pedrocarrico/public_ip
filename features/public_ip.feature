Feature: PublicIp CLI application
  In order to get my internet public IP address
  I want to have a CLI application with several services
  So I don't have to remember all those crazy curl commands

  Scenario: CLI application shows help and options
    When I get help for "public_ip"
    Then the exit status should be 0
    And the banner should be present
    And the banner should document that this app takes options
    And the following options should be documented:
      |--version|
      |--list-services|
    And the banner should document that this app's arguments are:
      |service|which is optional|

  Scenario: I want to list available services
    When I run `public_ip --list-services`
    Then the exit status should be 0
    And the output should contain:
      """
      The available services are:
      akamai (http://whatismyip.akamai.com)
      amazon_aws (http://checkip.amazonaws.com)
      curl_my_ip (http://curlmyip.net/)
      dyndns (http://checkip.dyndns.org)
      i_can_haz_ip (http://icanhazip.com)
      ident_me (http://ident.me)
      ifconfig_me (http://ifconfig.me/ip)
      ip_api (http://ip-api.com/json)
      ip_chicken (http://www.ipchicken.com/)
      ip_echo (http://ipecho.net/plain)
      ip_info (http://ipinfo.io/ip)
      ip_ogre (http://ipogre.com)
      ipify (http://api.ipify.org/?format=json)
      mx_toolbox (http://mxtoolbox.com/WhatIsMyIP/)
      private_internet_access (https://www.privateinternetaccess.com/pages/whats-my-ip/)
      smart_ip (http://smart-ip.net/myip)
      what_is_my_ip (https://www.whatismyip.com/)
      what_is_my_ip_address (http://bot.whatismyipaddress.com)
      wtf_is_my_ip (http://wtfismyip.com/json)
      You may pick a service and run public_ip [service] to get your IP address from that service
      """

  Scenario: I should see an error when I try to run with a non existing service
    When I run `public_ip not_a_real_service`
    Then the exit status should be 1
    And the output should contain:
      """
      Service not_a_real_service is not a valid service
      To see a list of available services use: public_ip --list-services
      """
