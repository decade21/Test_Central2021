*** Settings ***
Library           SeleniumLibrary
#Suite Teardown  Close Browser
*** Variables ***

${POWERBUY_URL}    https://www.powerbuy.co.th/th/
${Browser}    Chrome
${Powerbuy_Logo}    img-logo-desktop
${Search_Inbox}    txt-searchBox-input
${Search_Button}    btn-searchBox-input
${TV_Product_Check}    productGrid-260463
${Filter_44_55}    xpath=//*[@id="layout"]/div[2]/div[3]/div[2]/div/div[2]/div[1]/div/div/div/div/div[32]/div[2]/div/div/div[1]/div[1]/div
${Filter_32_43}    xpath=//*[@id="layout"]/div[2]/div[3]/div[2]/div/div[2]/div[1]/div/div/div/div/div[32]/div[2]/div/div/div[2]/div[1]/div
${Tv_44_55}    xpath=//*[@id="lnk-viewProduct-257184"]/div/div/img
${Tv_32_43}    xpath=//*[@id="lnk-viewProduct-249969"]/div/div/img
${Text_Search_Result}    lnk-viewBreadcrumb-undefined
${add_to_carth_44_55}    btn-addCart-257184
${add_to_carth_32_43}    btn-addCart-249969
${carh_mini}    xpath=//*[@id="btn-openMiniCart"]/img
${cart_check}    xpath=//*[@id="layout"]/div[2]/div[3]/div[2]/div[3]/div/div[2]/div[1]/div[1]/div/div[2]/button
${tv_44_55_cart_check}    xpath=//*[@id="lnk-viewProduct-257184"]
${tv_32_43_cart_check}    xpath=//*[@id="lnk-viewProduct-249969"]


*** Keywords ***
Open Powerbuy Website
    Open Browser    ${POWERBUY_URL}    ${Browser}
    Maximize Browser Window
    Wait Until Element Is Visible     ${Powerbuy_Logo}

Search TV in SerchBox
    Click Element    ${Search_Inbox}
    Input Text    ${Search_Inbox}    TV
    Click Button    ${Search_Button}
    Wait Until Element Is Visible    ${Text_Search_Result}

Filter TV Size
    [Arguments]    ${filter_size}
    Wait Until Keyword Succeeds      3x     5s    Click Element    ${filter_size}
    Wait Until Element Is Visible    ${Text_Search_Result}

Select TV
    [Arguments]    ${tv_size}
    sleep    3s
    Wait Until Keyword Succeeds      3x     5s    Click Element    ${tv_size}

Add To Cart
    [Arguments]    ${add_cart}
    Wait Until Keyword Succeeds      3x     5s      Click Element   ${add_cart}
    sleep    5s

Check Item in Cart
    sleep     5s
    Click Element    ${carh_mini}
    Wait Until Element Is Visible    ${cart_check}
    Page Should Contain Element    ${tv_44_55_cart_check}
    Page Should Contain Element    ${tv_32_43_cart_check}

*** Test Cases ***
Shopping Cart
    Open Powerbuy Website
    Search TV in SerchBox
    Filter TV Size    ${Filter_44_55}
    Select TV    ${Tv_44_55}
    Add To Cart    ${add_to_carth_44_55}
    Search TV in SerchBox
    Filter TV Size    ${Filter_32_43}
    Select TV    ${Tv_32_43}
    Add To Cart    ${add_to_carth_32_43}
    Check Item in Cart

