<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/CATALOG">
        <html>
        <head>
            <title>
                <xsl:value-of select="OWNER" />
            </title>
        </head>
        <body>
            <h1>Ejemplo transformación XSLT <xsl:value-of select="@tienda" /></h1>
            <ul>                 
                <xsl:for-each select="CD">
                    <li> <xsl:value-of select="TITLE" />   </li>
                </xsl:for-each>
            </ul>
        </body>
        </html>

    </xsl:template>
</xsl:stylesheet>