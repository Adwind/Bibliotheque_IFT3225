<?xsl version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" 
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-
        transitional.dtd" 
        doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Bibliothèque</title>
                <link rel="stylesheet" type="text/css" href="livre.css"></link>
            </head>
            <body>
                <h2>Auteur des livres de la bibliothèque</h2>
                <a href="./livre.html">Pour voir les livres</a>
                <table>
                    <tr>
                        <th>Auteur</th>
                        <th>Pays</th>
                        <th>Photo</th>
                        <th>Commentaire</th>
                        <th>Livres</th>
                    </tr>
                    <xsl:for-each select="bibliotheque/auteur">
                        <tr>
                            <td><xsl:value-of select="concat(prenom,' ',nom)"/></td>
                            <td><xsl:value-of select="pays"/></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="boolean(photo)">
                                        <img>
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="photo"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of select="concat(prenom,' ',nom)"/>
                                            </xsl:attribute>
                                        </img>
                                    </xsl:when>
                                    <xsl:otherwise>No Picture</xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td><xsl:value-of select="commentaire"/></td>
                            <td>
                                <xsl:variable name="author" select="@ident"></xsl:variable>
                                <ul>
                                    <xsl:for-each select="../livre">
                                        <xsl:if test="auteurs/@ident = $author">
                                            <li><xsl:value-of select="titre"/></li>
                                        </xsl:if>
                                    </xsl:for-each>
                                </ul>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>    
</xsl:stylesheet>