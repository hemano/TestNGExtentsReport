<#assign systemAttributeContext=report.getSystemAttributeContext().getSystemAttributeList()>
<#assign pass="#8CA93E">
<#assign fail="#FF7F7F">

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Emailable Report</title>
</head>
<body>
<h1>Emailable Report</h1>

<#list systemAttributeContext>
<p>
    <em>System Configuration</em><br/>
    <#items as sysConfig>
        <strong>${sysConfig.name}</strong>: ${sysConfig.value}<#sep>,
    </#items>
</p>
</#list>

<table width="100%" border="1" cellspacing="2" cellpadding="10" style="border-collapse: collapse; display: table;">
    <tbody>
    <tr>
        <th>Test Method</th>
        <th>Status</th>
        <th>Start Time</th>
        <th>Duration</th>
    </tr>

        <#list report.testList as test>

        <tr bgcolor=<#if test.status=="pass">${pass}<#else>${fail}</#if>>
            <td>
                <font color="white"><em>${test.name}</em></font>
            </td>
            <td>
                <font color="white">${test.status?upper_case}</font>
            </td>
            <td>
                <font color="white">${test.startTime?datetime?string}</font>
            </td>
            <td>
                <font color="white">${test.getRunDuration()?string}</font>
            </td>
        </tr>

        </#list>

    </tbody>
</table>


<p style="color: gray; font-size: 10px; text-align: right;">
    Reports by <a href="https://github.com/hemano">hemano</a>
</p>
</body>
</html>