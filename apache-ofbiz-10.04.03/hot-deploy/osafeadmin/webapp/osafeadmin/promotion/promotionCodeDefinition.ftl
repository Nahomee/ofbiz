<#if mode?has_content>
  <#if productPromoCode?has_content>

    <#assign productPromoCodeId = productPromoCode.productPromoCodeId!"" />
    <#assign promoCodeUseLimitPerCode = productPromoCode.useLimitPerCode!"" />
    <#assign promoCodeUseLimitPerCustomer = productPromoCode.useLimitPerCustomer!"" />
    <#assign promoCodeUserEntered = productPromoCode.userEntered!"" />
    <#if productPromoCode.fromDate?has_content>
      <#assign promoCodeFromDate = (productPromoCode.fromDate)?string(preferredDateFormat)>
    </#if>
    <#if productPromoCode.thruDate?has_content>
      <#assign promoCodeThruDate = (productPromoCode.thruDate)?string(preferredDateFormat)>
    </#if>
    
  </#if> 

  <input type="hidden" name="productPromotionId" value="${parameters.productPromotionId!productPromotionId!""}" />
  <div class="infoRow row">
    <div class="infoEntry long">
      <div class="infoCaption">
        <label>${uiLabelMap.PromotionCodeIdCaption}</label>
      </div>
      <div class="infoValue">
        <#if mode?has_content && mode == "add">
          <input class="medium" name="productPromoCodeId" type="text" id="productPromoCodeId" maxlength="20" value="${parameters.productPromoCodeId?default("")}"/>
        <#elseif mode?has_content && mode == "edit">
          <input type="hidden" name="productPromoCodeId" value="${parameters.productPromoCodeId!productPromoCodeId!""}" />${productPromoCodeId!""}
        </#if>
      </div>
    </div>
  </div>

  <div class="infoRow">
    <div class="infoEntry long">
      <div class="infoCaption">
        <label>${uiLabelMap.PromotionCodeLimitPerCodeCaption}</label>
      </div>
      <div class="infoValue small">
        <input type="text"  class="textEntry" name="promoCodeUseLimitPerCode" maxlength="20" value='${parameters.promoCodeUseLimitPerCode!promoCodeUseLimitPerCode!""}'/>
          <a href="javascript:void(0);" onMouseover="showTooltip(event,'${uiLabelMap.PromoCodeUseLimitPerCodeHelpInfo}');" onMouseout="hideTooltip()"><span class="helpIcon"></span></a>
      </div>

      <div class="">
        <label class="extraSmallLabel">${uiLabelMap.PromotionCodeLimitPerCustomerCaption}</label>
      </div>
      <div class="infoValue small">
        <input type="text"  class="textEntry" name="promoCodeUseLimitPerCustomer" maxlength="20" value='${parameters.promoCodeUseLimitPerCustomer!promoCodeUseLimitPerCustomer!""}'/>
          <a href="javascript:void(0);" onMouseover="showTooltip(event,'${uiLabelMap.PromoCodeUseLimitPerCustomerHelpInfo}');" onMouseout="hideTooltip()"><span class="helpIcon"></span></a>
      </div>

      <div class="">
        <label class="extraSmallLabel">${uiLabelMap.PromotionCodeUserEnterCaption}</label>
      </div>
      <div class="entry checkbox short">
        <input class="checkBoxEntry" type="radio" id="promoCodeUserEntered" name="promoCodeUserEntered" value="Y" <#if ((parameters.promoCodeUserEntered?exists && parameters.promoCodeUserEntered?string == "Y") || (promoCodeUserEntered?exists && promoCodeUserEntered?string == "Y"))>checked="checked"</#if>/>${uiLabelMap.PromotionCodeUserEnterYesLabel}
        <input class="checkBoxEntry" type="radio" id="promoCodeUserEntered" name="promoCodeUserEntered" value="N" <#if ((parameters.promoCodeUserEntered?exists && parameters.promoCodeUserEntered?string == "N") || (promoCodeUserEntered?exists && promoCodeUserEntered?string == "N"))>checked="checked"</#if>/>${uiLabelMap.PromotionCodeUserEnterNoLabel}
      </div>
    </div>
  </div>

  <div class="infoRow">
    <div class="infoEntry long">
      <div class="infoCaption">
        <label>${uiLabelMap.PromotionCodeActiveFromCaption}</label>
      </div>
      <div class="infoValue small">
        <div class="entryInput from">
          <input class="dateEntry" type="text" id="promoCodeFromDate" name="promoCodeFromDate" maxlength="40" value="${parameters.promoCodeFromDate!promoCodeFromDate!""}"/>
        </div>
      </div>

      <div class="">
        <label class="extraSmallLabel">${uiLabelMap.PromotionCodeActiveThruCaption}</label>
      </div>
      <div class="infoValue small">
        <div class="entryInput from">
          <input class="dateEntry" type="text" id="promoCodeThruDate" name="promoCodeThruDate" maxlength="40" value="${parameters.promoCodeThruDate!promoCodeThruDate!""}"/>
        </div>
      </div>
    </div>
  </div>

<#else>
    ${uiLabelMap.NoDataAvailableInfo}
</#if>
