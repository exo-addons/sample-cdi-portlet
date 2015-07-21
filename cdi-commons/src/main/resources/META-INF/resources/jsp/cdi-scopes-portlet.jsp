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
<%@ page import="javax.portlet.RenderResponse" %>
<%@ page import="javax.portlet.ResourceURL" %>
<%
	RenderResponse renderRes = (RenderResponse)request.getAttribute("javax.portlet.response");
	String namespace = renderRes.getNamespace();
	String myActionURL = renderRes.createActionURL().toString();
	String renderURL = renderRes.createRenderURL().toString();
	ResourceURL	resourceURL = renderRes.createResourceURL();	
	resourceURL.setResourceID("lifecycleScopedBean.getText()");
	String getText1 = resourceURL.toString();
	resourceURL.setResourceID("redisplayScopedBean.getText()");
	String getText2 = resourceURL.toString();
	resourceURL.setResourceID("lifecycleScopedBean.setText()");
	String setText1 = resourceURL.toString();
	resourceURL.setResourceID("redisplayScopedBean.setText()");
	String setText2 = resourceURL.toString();
	
%>
<div class="CDIScopesPortlet">
    <script type="text/javascript">
        function <%=namespace%>callResource(url) {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (this.readyState == 4) {
                    alert(xhr.responseText);
                }
            };
            xhr.open("GET", url, true);
            xhr.send();
        }
    </script>

    <h1>Portlet Using Portet-Specific CDI Scopes</h1>
    
    <p>
        Before you proceed, you may want to read 
        <a id="gatein.devguide.cdi.scope.portlets.url" href="https://docs.jboss.org/author/display/GTNPORTAL37/Portlet+CDI+Scopes">Portlet CDI Scopes</a>
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
    <a href="<%=renderURL%>">revisiting this page</a>.
    
    <p>
        <a href="#" onclick="<%=namespace%>callResource('<%=setText1%>');return false;">Set 
        <code>lifecycleScopedBean.text</code></a> to 'Ajax' using <code>ResourceRequest</code> of Portlet API 2.0.
    </p>
    <p>
        <a href="#" onclick="<%=namespace%>callResource('<%=getText1%>');return false;">Get current 
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
    <a href="<%=renderURL%>">revisiting this page</a>.
    <p>
        <a href="#" onclick="<%=namespace%>callResource('<%=setText2%>');return false;">Set <code>redisplayScopedBean.text</code></a> to 'Ajax' using
        <code>ResourceRequest</code>
        of Portlet API 2.0.
    </p>
    <p>
        <a href="#" onclick="<%=namespace%>callResource('<%=getText2%>');return false;">Get current <code>redisplayScopedBean.text</code></a> from server
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