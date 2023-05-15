<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" />
    
    <xsl:template match="/CATALOG">
    
        <xsl:for-each select="CD">
            <xsl:value-of select="concat(TITLE, ', ', ARTIST, '&#xa;')" />
            <!-- <xsl:value-of select="TITLE" />
            <xsl:text>, </xsl:text>
            <xsl:value-of select="ARTIST" /> 
            <xsl:text>&#xa;</xsl:text>  -->
            <!-- genera salto linea -->
        </xsl:for-each>
    
    </xsl:template>

</xsl:stylesheet>