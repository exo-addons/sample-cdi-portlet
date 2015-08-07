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
    font-size: 20px;
    background-color: #dedfdf;
    padding: 2px 4px;
    margin-bottom: 2px;
}

.CDIScopesPortlet h2 {
    font-size: 18px;
    padding: 4px;
    margin-top: 30px;
}

.CDIScopesPortlet p {
    margin-left: 4px;
}

.CDIScopesPortlet code {
    white-space: normal;
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
        <a id="gatein.devguide.cdi.scope.portlets.url" href="https://docs.jboss.org/author/display/GTNPORTAL37/Portlet+CDI+Scopes" target="_blank">Portlet CDI Scopes</a>
    </p>
    
    <h2>@PortletLifecycleScoped bean</h2>
    <p>
        The current value of <code>lifecycleScopedBean.text</code> during <b>render</b> phase: <code>"${lifecycleScopedBean.getText()}"</code>
    </p>
    <form action="<%=myActionURL%>" method="POST">
        <p>
            Submit a value to be set on <code>lifecycleScopedBean.text</code> using <b>Action Request</b> of Portlet API 2.0.<br />
            Text:<input type="text" name="text" /> <input type="Submit" name="lifecycleScopedBean.setText()" value="Submit"/>
        </p>
    </form>
    <p>
      The new value set in the above form will <b>NOT</b> be retained for any further <b>Render Request</b>.<br>
      It means the value will be back to initial text for next refresh,
      or you can force performing <b>render</b> again through <a href="<%=renderURL%>">revisiting this page</a>.
    </p>
    <p>
      The <a href="#" onclick="<%=namespace%>callResource('<%=getText1%>');return false;">current value</a> of <code>lifecycleScopedBean.text</code>
      in <b>Resource Request</b> will NOT be reflected from the bean instance used during ActionRequest, EventRequest or RenderRequest. 
    </p>
    <p>
      <a href="#" onclick="<%=namespace%>callResource('<%=setText1%>');return false;">Set new value 'Ajax'</a>
      to <code>lifecycleScopedBean.text</code> using <b>Resource Request</b> of Portlet API 2.0
      will NOT reflect on the bean instance used during an ActionRequest, EventRequest or RenderRequest.
    </p>

    <h2>@PortletRedisplayScoped bean</h2>
    <p>
      The current value of <code>redisplayScopedBean.text</code> during <b>render</b> phase: <code>"${redisplayScopedBean.getText()}"</code>
    </p>
    <form action="<%=myActionURL%>" method="POST">
        <p>
          Submit a value to be set on <code>redisplayScopedBean.text</code> using <b>Action Request</b> of Portlet API 2.0.<br />
          Text:<input type="text" name="text" /> <input type="Submit" name="redisplayScopedBean.setText()" value="Submit"/>
        </p>
    </form>
    <p>
      The new value set in the above form will be retained for subsequent <b>Render Request</b>.<br>
      Try performing <b>render</b> again through <a href="<%=renderURL%>">revisiting this page</a>.
    </p>
    <p>
      The value of <code>redisplayScopedBean.text</code> will be reset when an ActionRequest or EventRequest or ResourceRequest is trigged.
      Now try performing a <b>Resource Request</b> to <a href="#" onclick="<%=namespace%>callResource('<%=getText2%>');return false;">get the current value</a>
       of <code>redisplayScopedBean.text</code> from server. Then <a href="<%=renderURL%>">revisiting this page</a> to see the value will be reset to initial text.
    </p>
    <p>
      <a href="#" onclick="<%=namespace%>callResource('<%=setText2%>');return false;">Set new value 'Ajax'</a>
      to <code>redisplayScopedBean.text</code> using <b>Resource Request</b> of Portlet API 2.0
      will reflect on the bean instance used during next <b>Render Request</b>. Then try <a href="<%=renderURL%>">revisiting this page</a> to see the new value.
    </p>
    <br>
    <br>
    <br>
    <br>
    <form action="<%=myActionURL%>" method="POST">
        <p> Trigger an <b>Action Request</b> without doing anything will reset all beans. <input type="Submit" name="reset" value="Reset All Beans"/></p>
    </form>
</div>