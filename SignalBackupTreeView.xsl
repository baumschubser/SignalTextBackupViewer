<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:key name="sms-grouped-by-address" match="sms" use="@address" />

    <xsl:template match="smses">
        <html>
        <head>
        <style>
        body {
		  font-family: sans-serif;
		  fonts-size: 10px;
		  color: #191919;
		}

		.thread {
		  margin: 5px;
		  padding: 5px;
		  background-color: lightblue;
		  max-width: 600px;
		}

		.address, .address_name {
		  padding: 10px 5px;
		  background: lightyellow;
		  float:right;
		}

		.message {
		  border: 2px solid darkgray;
		  margin: 3px;
		  padding: 3px;
		}
		.message.receiving:before {
			content:'ʘ ←';
		}
		.message.sending:before {
			content: 'ʘ →';
		}
        </style>
        </head>
        <body>
	        <xsl:for-each select="sms[count(. | key('sms-grouped-by-address', @address)[1]) = 1]">
	        	<xsl:sort select="@address" />
	        	<xsl:element name="div">
	            	<xsl:attribute name="class">thread</xsl:attribute>
	            	<xsl:if test="@contact_name != 'null'">
	            		<xsl:element name="span">
	            			<xsl:attribute name="class">address_name</xsl:attribute>
	            			<xsl:value-of select="@contact_name"/>
	        			</xsl:element> <!-- /address_name -->
					</xsl:if>
					<xsl:element name="a">
						<xsl:attribute name="href">#</xsl:attribute>
						<xsl:attribute name="class">show</xsl:attribute>
			    		<xsl:element name="span">
				    		<xsl:attribute name="class">address</xsl:attribute>
			        		<xsl:value-of select="@address"/>
			    		</xsl:element> <!-- /address -->
		    		</xsl:element>
					<xsl:element name="a">
						<xsl:attribute name="href">#</xsl:attribute>
						<xsl:attribute name="class">hide</xsl:attribute>
			    		<xsl:element name="span">
				    		<xsl:attribute name="class">address</xsl:attribute>
			        		<xsl:value-of select="@address"/>
			    		</xsl:element> <!-- /address -->
		    		</xsl:element>
	        		<xsl:for-each select="key('sms-grouped-by-address', @address)">
			    		<xsl:element name="div">
				        	<xsl:attribute name="class">
				        		message 
				        	<xsl:if test="@type = '1'">
				        		receiving
				        	</xsl:if>
				        	<xsl:if test="@type = '2'">
				        		sending
			        		</xsl:if>
			        		</xsl:attribute>
	 						<xsl:element name="div">
	 							<xsl:attribute name="class">date</xsl:attribute>
	 							<xsl:value-of select="@readable_date"/>
	 						</xsl:element> <!-- /date -->
	 						<xsl:element name="div">
	 							<xsl:attribute name="class">messagebody</xsl:attribute>
	 							<xsl:value-of select="@body"/>
							</xsl:element> <!-- /messagebody -->
						</xsl:element> <!-- /message -->
	        		</xsl:for-each>
	        	</xsl:element> <!-- /thread -->
	        </xsl:for-each>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
