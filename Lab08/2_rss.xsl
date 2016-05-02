<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
	<xsl:template match="/VESSELS">
		<html>
			<body> 
			<div id = "vesselToAdd">
	<xsl:for-each select="VESSLES/vessel">
	 <xsl:value-of select="@MMSI" /></li>
	</xsl:for-each>
	</xsl:template>
	</div>
	</body>
	</html>
</xsl:stylesheet>