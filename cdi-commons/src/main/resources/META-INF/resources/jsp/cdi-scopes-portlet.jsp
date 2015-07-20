<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<style>
div.CDIScopesPortlet {
    margin: 10px;
}

.CDIScopesPortlet a {
    color: #2c6fbd;
}
.CDIScopesPortlet a:hover {
    text-decoration: underline;
}

.CDIScopesPortlet h1 {
    font-size: 16px;
    background-color: #dedfdf;
    padding: 2px 4px;
    margin-bottom: 2px;
}

.CDIScopesPortlet h2 {
    font-size: 14px;
    padding: 4px;
    margin: 0;
}

.CDIScopesPortlet p {
    margin-left: 4px;
}
</style>
<div class="CDIScopesPortlet">
    <script type="text/javascript">
        function <portlet:namespace/>callResource(type) {
            var xhr = new XMLHttpRequest();
            var url = '<portlet:resourceURL id="'+type+'" />';
            xhr.onreadystatechange = function() {
                if (this.readyState == 4) {
                    alert(xhr.responseText);
                }
            };
            xhr.open("GET", url, true);
            xhr.send();
        }
    </script>
    <portlet:actionURL var="myActionURL" />

    <h1>Portlet Using Portet-Specific CDI Scopes</h1>
    
    <p>
        Before you proceed, you may want to read 
        <a id="gatein.devguide.cdi.scope.portlets.url" href="https://docs.jboss.org/author/display/GTNPORTAL37/Portlet+CDI+Scopes">Portlet CDI Scopes</a>
        Section of <span id="compatibility.portal.projectNameShort">JPP</span> Developer Guide.
    </p>
    
    <h2><code>@PortletLifecycleScoped</code></h2>
    <p>
        <code>lifecycleScopedBean.text</code> value during <code>Portlet.doView()</code>: 
        <code>"${lifecycleScopedBean.getText()}"</code>
    </p>
    <form action="<%=myActionURL%>" method="POST">
        <p>
            Set
            <code>lifecycleScopedBean.text</code>
            using
            <code>ActionRequest</code>
            of Portlet API 2.0.<br />
            Text:<input type="text" name="text" /> <input type="Submit" name="lifecycleScopedBean.setText()" value="Submit"/>
        </p>
    </form>
    <p>After setting a new text using the above form, force performing <code>Portlet.doView()</code> again through 
    <a href="<portlet:renderURL />">revisiting this page</a>.
    
    <p>
        <a href="#" onclick="<portlet:namespace/>callResource('lifecycleScopedBean.setText()');return false;">Set 
        <code>lifecycleScopedBean.text</code></a> to 'Ajax' using <code>ResourceRequest</code> of Portlet API 2.0.
    </p>
    <p>
        <a href="#" onclick="<portlet:namespace/>callResource('lifecycleScopedBean.getText()');return false;">Get current 
        <code>lifecycleScopedBean.text</code></a> from server using <code>ResourceRequest</code> of Portlet API 2.0.
    </p>

    <h2><code>@PortletRedisplayScoped</code></h2>
    <p>
        <code>redisplayScopedBean.text</code> value during <code>Portlet.doView()</code>: 
        <code>"${redisplayScopedBean.getText()}"</code>
    </p>
    <form action="<%=myActionURL%>" method="POST">
        <p>
            Set
            <code>redisplayScopedBean.text</code>
            using
            <code>ActionRequest</code>
            of Portlet API 2.0.<br />
            Text:<input type="text" name="text" /> <input type="Submit" name="redisplayScopedBean.setText()" value="Submit"/>
        </p>
    </form>
    <p>After setting a new text using the above form, force performing <code>Portlet.doView()</code> again through 
    <a href="<portlet:renderURL />">revisiting this page</a>.
    <p>
        <a href="#" onclick="<portlet:namespace/>callResource('redisplayScopedBean.setText()');return false;">Set <code>redisplayScopedBean.text</code></a> to 'Ajax' using
        <code>ResourceRequest</code>
        of Portlet API 2.0.
    </p>
    <p>
        <a href="#" onclick="<portlet:namespace/>callResource('redisplayScopedBean.getText()');return false;">Get current <code>redisplayScopedBean.text</code></a> from server
        using
        <code>ResourceRequest</code>
        of Portlet API 2.0.
    </p>

    <form action="<%=myActionURL%>" method="POST">
        <p>
        <br />
            <input type="Submit" name="reset" value="Reset All Beans"/>
        </p>
    </form>
</div>