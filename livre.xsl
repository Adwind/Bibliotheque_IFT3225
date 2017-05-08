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
                <h2>Livre de la bibliothèque</h2>
                <a href="./auteur.html">Pour voir les auteurs</a>
                <table>
                    <tr>
                        <th>Titre</th>
                        <th>Annee</th>
                        <th>Auteur</th>
                        <th>Prix</th>
                        <th>Type</th>
                        <th>Couverture</th>
                        <th>Film</th>
                        <th>Commentaire</th>
                        <th>Personnage(s)</th>
                    </tr>
                    <xsl:for-each select="bibliotheque/livre">
                        <xsl:sort select="prix/valeur" data-type="number" order="descending"/>
                        <tr>
                            <td><xsl:value-of select="titre"/></td>
                            <td><xsl:value-of select="annee"/></td>
                            <td>
                                <xsl:variable name="author" select="auteurs/@ident"></xsl:variable>
                                <xsl:value-of select="concat(../auteur[@ident=$author]/prenom,' ',../auteur[@ident=$author]/nom)"/>
                            </td>
                            <td><xsl:value-of select="prix/valeur"/></td>
                            <td><xsl:value-of select="prix/monnaie"/></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="boolean(couverture)">
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="couverture"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:value-of select="titre"/>
                                    </xsl:attribute>
                                </img>
                                    </xsl:when>
                                    <xsl:otherwise>No Picture</xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td><xsl:value-of select="film"/></td>
                            <td><xsl:value-of select="commentaire"/></td>
                            <td>
                                <ul>
                                    <xsl:for-each select="personnage">
                                        <li><xsl:value-of select="concat(prenom,' ', nom)"/></li>
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
