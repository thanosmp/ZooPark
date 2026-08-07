<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
<!--  Σύνδεση trainer id με όνομα φροντιστή  -->
<xsl:key name="trainerById" match="trainer" use="@trid"/>
<xsl:template match="/">
<animals_to_see>
<xsl:apply-templates select="zoo_park/animal_list/animal"/>
</animals_to_see>
</xsl:template>
<xsl:template match="animal">
<animal>
<animal_name>
<xsl:value-of select="animal_names_info/@animal_name"/>
</animal_name>
<scientific_name>
<xsl:value-of select="animal_names_info/@scientific_name"/>
</scientific_name>
<trainers>
<xsl:call-template name="print-trainers">
<xsl:with-param name="ids" select="normalize-space(trainers/@trainer_id)"/>
</xsl:call-template>
</trainers>
</animal>
</xsl:template>
<!--  Αναδρομική επεξεργασία των trainer ids, π.χ. 'T3 T4'  -->
<xsl:template name="print-trainers">
<xsl:param name="ids"/>
<xsl:choose>
<xsl:when test="contains($ids, ' ')">
<xsl:variable name="firstId" select="substring-before($ids, ' ')"/>
<xsl:variable name="restIds" select="normalize-space(substring-after($ids, ' '))"/>
<trainer>
<xsl:attribute name="id">
<xsl:value-of select="$firstId"/>
</xsl:attribute>
<xsl:value-of select="key('trainerById', $firstId)/@name"/>
</trainer>
<xsl:call-template name="print-trainers">
<xsl:with-param name="ids" select="$restIds"/>
</xsl:call-template>
</xsl:when>
<xsl:when test="$ids != ''">
<trainer>
<xsl:attribute name="id">
<xsl:value-of select="$ids"/>
</xsl:attribute>
<xsl:value-of select="key('trainerById', $ids)/@name"/>
</trainer>
</xsl:when>
</xsl:choose>
</xsl:template>
</xsl:stylesheet>