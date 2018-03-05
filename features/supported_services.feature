Feature: PublicIp supported services
  In order to make sure this CLI app works
  I want to test every supported service
  So that I'm sure that they work

  Scenario: Akamai
    When I run `public_ip akamai`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: AWS
    When I run `public_ip amazon_aws`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: Curl my IP
    When I run `public_ip curl_my_ip`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: DynDNS
    When I run `public_ip dyndns`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: I can haz IP
    When I run `public_ip i_can_haz_ip`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: Ident Me
    When I run `public_ip ident_me`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: Ip API
    When I run `public_ip ip_api`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: Ifconfig Me
    When I run `public_ip ifconfig_me`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: IP Chicken
    When I run `public_ip ip_chicken`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: IP Echo
    When I run `public_ip ip_echo`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: IP Info
    When I run `public_ip ip_info`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: IPify
    When I run `public_ip ipify`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: MxToolbox
    When I run `public_ip mx_toolbox`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: Private Internet Access
    When I run `public_ip private_internet_access`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: Smart IP
    When I run `public_ip smart_ip`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: What is my IP
    When I run `public_ip what_is_my_ip`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: What is my IP address
    When I run `public_ip what_is_my_ip_address`
    Then the exit status should be 0
    And the output should be a valid ip address

  Scenario: WTF is my IP
    When I run `public_ip wtf_is_my_ip`
    Then the exit status should be 0
    And the output should be a valid ip address