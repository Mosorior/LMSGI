<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="xml" encoding="utf-8" indent="yes" />


    <xsl:template match="/CATALOG">
        <xsl:comment>Ejemplo comentario generado desde XSLT</xsl:comment>

        <xsl:element name="salida">
            <xsl:attribute name="propietario">
                <xsl:value-of select="OWNER" />
            </xsl:attribute>

            <xsl:element
                name="resumen">
                <xsl:for-each select="desc/par">
                    <xsl:value-of select="." />
                </xsl:for-each>
            </xsl:element>
            <lugarVenta
                url="{@tienda}">
                <xsl:value-of select="@tienda" />
            </lugarVenta>
            <xsl:element name="saludo">Hola
        Mundo</xsl:element> 
            <autor>
                <xsl:value-of select="OWNER" />
                <xsl:text>, nacido en </xsl:text>
                <xsl:value-of select="OWNER/@country" />
            </autor>

            <xsl:for-each
                select="CD[YEAR&lt;'1985']">
                <!-- <xsl:sort select="PRICE"  order="descending" data-type="number"/> -->
                <xsl:sort select="TITLE" />

                <xsl:element name="titulo">
                    <xsl:attribute name="publicado">
                        <xsl:value-of select="YEAR" />
                        <xsl:text>, </xsl:text>
                        <xsl:value-of
                            select="COMPANY" />
                    </xsl:attribute>

                    <xsl:element
                        name="artistas">
                        <xsl:for-each select="band/musician">
                            <xsl:value-of select="." />
                            <xsl:if test="position()!=last()">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:element>

                  <xsl:element
                        name="datos">
                        <xsl:value-of select="position()" />
                        <xsl:if test="position()=last()">EL
        último </xsl:if>
                        <xsl:text> - </xsl:text>
                        <xsl:choose>
                            <xsl:when test="PRICE&lt;8"> ¡OFERTA!</xsl:when>
                            <xsl:when test="PRICE&lt;10"> ¡BUEN PRECIO!</xsl:when>
                            <xsl:otherwise> ¡Novedad!</xsl:otherwise>
                        </xsl:choose>

                        <!-- <xsl:if test="PRICE&lt;9"> ¡OFERTA! </xsl:if> -->
                        <!-- <xsl:value-of select="PRICE" />
                        <xsl:text> - </xsl:text>
                        <xsl:value-of select="TITLE" />
                        <xsl:text>: </xsl:text> 
                        <xsl:value-of  select="ARTIST" /> -->
                        <xsl:value-of select='concat(PRICE, " - ", TITLE, ": ", ARTIST )' />

                    </xsl:element>
                </xsl:element>
            </xsl:for-each>

        </xsl:element>


    </xsl:template>

</xsl:stylesheet>