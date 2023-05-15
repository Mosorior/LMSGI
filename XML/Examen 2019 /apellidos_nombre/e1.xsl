<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <memoria>
      <xsl:apply-templates select="proyecto"/>
    </memoria>
  </xsl:template>

  <xsl:template match="proyecto">
    <xsl:variable name="lang" select="@lang"/>
    <xsl:variable name="idioma">
      <xsl:choose>
        <xsl:when test="$lang = 'es'">Castellano</xsl:when>
        <xsl:when test="$lang = 'fr'">Francés</xsl:when>
        <xsl:when test="$lang = 'en'">Inglés</xsl:when>
        <xsl:when test="$lang = 'ge'">Alemán</xsl:when>
        <xsl:otherwise>Desconocido</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <titular>
      <xsl:value-of select="datos_proyecto/titulo"/>
      <xsl:text> (</xsl:text>
      <xsl:value-of select="$idioma"/>
      <xsl:text>)</xsl:text>
    </titular>

    <xsl:attribute name="fecha">
      <xsl:value-of select="datos_proyecto/fecha_publicacion"/>
    </xsl:attribute>

    <autores>
      <xsl:for-each select="datos_proyecto/autor">
        <xsl:value-of select="apellidos"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="nombre"/>
        <xsl:if test="position() != last()">
          <xsl:text> y </xsl:text>
        </xsl:if>
      </xsl:for-each>
    </autores>

    <xsl:apply-templates select="datos_proyecto/bibliografia"/>

    <xsl:apply-templates select="apartado"/>
  </xsl:template>

  <xsl:template match="bibliografia">
    <biografia>
      <xsl:apply-templates select="referencia"/>
    </biografia>
  </xsl:template>

  <xsl:template match="referencia">
    <a href="{@enlace}">
      <xsl:value-of select="."/>
    </a>
  </xsl:template>

  <xsl:template match="apartado">
    <xsl:variable name="id" select="@id"/>
    <h2>
      <xsl:value-of select="concat('(', $id, ') ')"/>
      <xsl:value-of select="titulo"/>
    </h2>
    <xsl:apply-templates select="seccion"/>
  </xsl:template>

  <xsl:template match="seccion">
    <h3>
      <xsl:value-of select="titulo"/>
    </h3>
    <xsl:apply-templates select="parrafo[not(@estilo = 'revisar')]"/>
  </xsl:template>

    <xsl:template match="parrafo">
    <xsl:if test="@estilo != 'revisar'">
      <p>
        <xsl:value-of select="."/>
      </p>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>
