<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
	<xsl:template match="/">
		<html>
			<head> 
				<title>
					<xsl:value-of select="crewlist/title"/>
				</title>
			</head>
			<body>
				
		<xsl:apply-templates select="crewlist"/>
		
		</body>
		</html>
	</xsl:template>

	<xsl:template match="crewlist">
		<div id="crewInfo">
			<table border='1'>
				
				<xsl:apply-templates select="crew"/>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="crew" >
		<tr> 
			<td><xsl:value-of select="fname" /></td>
			<td><xsl:value-of select="lname" /></td>
			<td><xsl:value-of select="boat" /></td>
			<td><xsl:value-of select="position" /></td>
			<td><xsl:value-of select="homestate" /></td> 
		</tr>	
	</xsl:template>
</xsl:stylesheet>