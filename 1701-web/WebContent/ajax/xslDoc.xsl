<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" encoding="utf-8"/>
	<xsl:template match="board">
		<xsl:for-each select="item">
			<div class='list'>
				<span class='serial'>
					<xsl:value-of select="serial"/>
				</span>
				<span class='wordker'>
					<xsl:value-of select = "worker"/>
				</span>
				<span class='subject'>
					<xsl:value-of select="subject"/>
				</span>
				<span class='mdate'>
					<xsl:value-of select="mdate"/>
				</span>
				<span class='hit'>
					<xsl:value-of select="hit"/>
				</span>
			</div>			
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>