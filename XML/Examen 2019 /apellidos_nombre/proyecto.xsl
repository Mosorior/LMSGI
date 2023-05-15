<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="xml" indent="yes" encoding="utf-8"/>

    <xsl:template match="/proyecto">
        <xsl:element name="memoria">
            <xsl:attribute name="fecha">
                <xsl:value-of select="datos_proyecto/fecha_publicacion" />
            </xsl:attribute>
            <xsl:element name="titular">
                <xsl:value-of select="datos_proyecto/titulo" />
                <xsl:choose>
                    <xsl:when test="@lang='es'">
                        <xsl:text> (Castellano)</xsl:text>
                    </xsl:when> 
                    <xsl:when test="@lang='fr'">
                        <xsl:text> (Frances)</xsl:text>
                    </xsl:when>  
                    <xsl:when test="@lang='en'">
                        <xsl:text> (Ingles)</xsl:text>
                    </xsl:when>  
                    <xsl:when test="@lang='ge'">
                        <xsl:text> (Alemán)</xsl:text>
                    </xsl:when>                                                                             
                </xsl:choose>
            </xsl:element>

            <xsl:element name="autores">
                <xsl:for-each select="datos_proyecto/autor">
                    <!-- <xsl:text> # </xsl:text> -->
                    <xsl:value-of select="apellidos" />
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="nombre" />
                    <!-- TODO: ojo y final usaar xsl:if position() y last()-->
                    <xsl:if test="position() != last()">
                        <xsl:text> y </xsl:text>
                    </xsl:if>
                    
                </xsl:for-each>
            </xsl:element>  <!-- autores -->
                        
            <xsl:for-each select="datos_proyecto/bibliografia/referencia">
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@enlace" />
                    </xsl:attribute>
                    <xsl:value-of select="." />
                </xsl:element>
            </xsl:for-each>

            <xsl:element name="blockquote">
                <xsl:for-each select="dedicatoria/parrafo">
                    <xsl:element name="p">
                        <xsl:value-of select="."></xsl:value-of>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>  <!-- blockquote -->

            <xsl:element name="texto">

                <xsl:for-each select="apartado">
                    <xsl:element name="h2">
<!--                         <xsl:text>(</xsl:text>
                        <xsl:value-of select="@id" />
                        <xsl:text>)</xsl:text> -->
                        <xsl:value-of select="concat(   '(',   @id,   ')'   )" />
                        <xsl:value-of select="titulo"/> 
                    </xsl:element>
                    <xsl:for-each select="seccion">
                        <xsl:element name="h3">
                            <xsl:value-of select="titulo"/> 
                        </xsl:element>
                        <xsl:for-each select="parrafo">
                            <xsl:if test="@estilo!='revisar'">
                                <xsl:element name="p">
                                    <xsl:value-of select="."></xsl:value-of>
                                </xsl:element>
                            </xsl:if>
                        </xsl:for-each>  <!-- parrafo -->
                    </xsl:for-each>  <!-- seccion -->
                </xsl:for-each>  <!-- apartado -->

            </xsl:element>  <!-- element texto -->
 
        </xsl:element>  <!-- memoria -->
    </xsl:template>
</xsl:stylesheet>