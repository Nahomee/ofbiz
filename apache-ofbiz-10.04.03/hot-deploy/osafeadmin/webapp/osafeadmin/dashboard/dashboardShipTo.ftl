<!-- start displayBox -->
<div class="displayBox dashboardSummary">
    <div class="header"><h2>${uiLabelMap.DashboardOnlineSaleHeading}</h2></div>
    <div class="boxBody">
        <table class="osafe">
            <tr class="heading">
                <th class="boxCaption firstCol">${uiLabelMap.SummaryLabel}</th>
                <th class="boxDollar">&nbsp;</th>
                <th class="boxNumber">${uiLabelMap.OrdLabel}</th>
                <th class="boxDollar lastCol">${uiLabelMap.SalesLabel}${globalContext.currencySymbol!}</th>
            </tr>
            <tr class="odd">
                <td class="boxCaption firstCol">${uiLabelMap.PeriodSummaryCaption}</td>
                <td class="boxNumber">&nbsp;</td>
                <td class="boxNumber">
                    <#if (orderCount!0) != 0>
                        <#assign defaultStatusList = "viewcreated" + "=" + "Y">
                        <#assign defaultStatusList = defaultStatusList + "&" + "viewprocessing" + "=" + "Y">
                        <#assign defaultStatusList = defaultStatusList + "&" + "viewapproved" + "=" + "Y">
                        <#assign defaultStatusList = defaultStatusList + "&" + "viewhold" + "=" + "Y">
                        <#assign defaultStatusList = defaultStatusList + "&" + "viewcompleted" + "=" + "Y">

                        <#assign orderDateFrom = "&orderDateFrom" + "=" + (periodFrom!parameters.periodFrom!"")>
                        <#assign orderDateTo = "&orderDateTo" + "=" + (periodTo!parameters.periodTo!"")>
                        <#assign initializedCB = "&initializedCB" + "=" + "Y">
                        <#assign preRetrieved = "&preRetrieved" + "=" + "Y">
                        <#assign srchShipTo = "&srchShipTo" + "=" + "Y">

                        <#assign orderManagementParams = defaultStatusList + orderDateFrom + orderDateTo+ initializedCB+ preRetrieved+ srchShipTo>

                        <a href="<@ofbizUrl>orderManagement?${orderManagementParams}</@ofbizUrl>">${orderCount}</a>
                    <#else>
                        ${orderCount?default('0')}
                    </#if>
                </td>
                <td class="boxDollar lastCol"><#if totalRevenue?has_content && totalRevenue &gt; 0> <@ofbizCurrency amount=totalRevenue!0 rounding=0 isoCode=globalContext.globalContext.defaultCurrencyUomId /><#else>${totalRevenue?default(0)}</#if></td>
            </tr>
            <tr class="even">
                <td class="boxCaption firstCol">${uiLabelMap.AverageOrderCaption}</td>
                <td class="boxNumber">&nbsp;</td>
                <td class="boxNumber">&nbsp;</td>
                <td class="boxDollar lastCol"><#if averageRevenue?has_content && averageRevenue &gt; 0> <@ofbizCurrency amount=averageRevenue!0 rounding=0 isoCode=globalContext.defaultCurrencyUomId /><#else>${averageRevenue?default(0)}</#if></td>
            </tr>
            <tr class="odd">
                <td class="boxCaption firstCol">${uiLabelMap.DailyAverageCaption} (${diffDays!"0"} ${uiLabelMap.DaysLabel}):</td>
                <td class="boxNumber">&nbsp;</td>
                <td class="boxNumber">${dailyAverageOrderCount?default('0')}</td>
                <td class="boxDollar lastCol"><#if dailyAverageRevenue?has_content && dailyAverageRevenue &gt; 0> <@ofbizCurrency amount=dailyAverageRevenue!0 rounding=0 isoCode=globalContext.defaultCurrencyUomId /><#else>${dailyAverageRevenue?default(0)}</#if></td>
            </tr>
            <tr class="even">
              <#if periodRecTrendRange?exists>
                <#assign rangeListperiodRec = Static["org.ofbiz.base.util.StringUtil"].split(periodRecTrendRange,"to")/>
              </#if>
                <#if rangeListperiodRec?has_content && rangeListperiodRec?size gt 1>
                  <#assign periodFrom = rangeListperiodRec.get(0)?trim/>
                  <#assign periodTo = rangeListperiodRec.get(1)?trim/>
                </#if>
                <#if rangeListperiodRec?has_content && rangeListperiodRec?size == 1>
                  <#assign periodFrom = rangeListperiodRec.get(0)?trim/>
                  <#assign periodTo = rangeListperiodRec.get(0)?trim/>
                </#if>
                <td class="boxCaption firstCol">${uiLabelMap.RecentTrendCaption}<span class="trendRange">
                   <#if periodRecTrendRange?exists>
                     (<a href="<@ofbizUrl>updatePeriodDashboardSummary?periodFrom=${periodFrom}&periodTo=${periodTo}</@ofbizUrl>">${periodRecTrendRange}</a>):
                   <#else>
                     ${uiLabelMap.NaCaption}
                   </#if>
                </span></td>
                <#assign recentTrendClass="noTrend">
                <#if recentTrendRevenue?has_content>
                   <#if (recentTrendRevenue < 0)>
                     <#assign recentTrendClass="negativeTrend">
                     <#assign recentTrendColorClass="negativeTrendColor">
                     <#assign recentTrendRevenue=-(recentTrendRevenue)>
                   <#elseif (recentTrendRevenue > 0)>
                     <#assign recentTrendClass="positiveTrend">
                     <#assign recentTrendColorClass="positiveTrendColor">
                   </#if>
                </#if>
                <td class="boxDollar ${recentTrendClass!""}">${recentTrendRevenue!"N/A"}<#if recentTrendRevenue?has_content>%</#if></td>
                <td class="boxNumber">${recentOrderCount?default('0')}</td>
                <td class="boxDollar lastRow lastCol ${recentTrendColorClass!""}"><#if recentTrendTotalRevenue?has_content && recentTrendTotalRevenue &gt; 0> <@ofbizCurrency amount=recentTrendTotalRevenue!0 rounding=0 isoCode=globalContext.defaultCurrencyUomId /><#else>${recentTrendTotalRevenue?default(0)}</#if></td>
            </tr>
            <tr class="odd">
              <#if periodPriorTrendRange?exists>
                <#assign rangeListperiodPrior = Static["org.ofbiz.base.util.StringUtil"].split(periodPriorTrendRange,"to")/>
              </#if>
                <#if rangeListperiodPrior?has_content && rangeListperiodPrior?size gt 1>
                  <#assign periodFrom = rangeListperiodPrior.get(0)?trim/>
                  <#assign periodTo = rangeListperiodPrior.get(1)?trim/>
                </#if>
                <#if rangeListperiodPrior?has_content && rangeListperiodPrior?size == 1>
                  <#assign periodFrom = rangeListperiodPrior.get(0)?trim/>
                  <#assign periodTo = rangeListperiodPrior.get(0)?trim/>
                </#if>
                <td class="boxCaption firstCol">${uiLabelMap.PriorTrendCaption}<span class="trendRange">
                   <#if periodPriorTrendRange?exists>
                     (<a href="<@ofbizUrl>updatePeriodDashboardSummary?periodFrom=${periodFrom}&periodTo=${periodTo}</@ofbizUrl>">${periodPriorTrendRange}</a>):
                   <#else>
                     ${uiLabelMap.NaCaption}
                   </#if>
                </span></td>
                <#assign priorTrendClass="noTrend">
                <#if priorTrendRevenue?has_content>
                   <#if (priorTrendRevenue < 0)>
                     <#assign priorTrendClass="negativeTrend">
                     <#assign priorTrendColorClass="negativeTrendColor">
                     <#assign priorTrendRevenue=-(priorTrendRevenue)>
                   <#elseif (priorTrendRevenue > 0)>
                     <#assign priorTrendClass="positiveTrend">
                     <#assign priorTrendColorClass="positiveTrendColor">
                   </#if>
                </#if>
                <td class="boxDollar ${priorTrendClass!""}">${priorTrendRevenue!"N/A"}<#if priorTrendRevenue?has_content>%</#if></td>
                <td class="boxNumber">${priorOrderCount?default('0')}</td>
                <td class="boxDollar lastRow lastCol ${priorTrendColorClass!""}"><#if priorTrendTotalRevenue?has_content && priorTrendTotalRevenue &gt; 0>  <@ofbizCurrency amount=priorTrendTotalRevenue!0 rounding=0 isoCode=globalContext.defaultCurrencyUomId /><#else>${priorTrendTotalRevenue?default(0)}</#if></td>
            </tr>
        </table>
    </div>
</div>
<!-- end displayBox -->

