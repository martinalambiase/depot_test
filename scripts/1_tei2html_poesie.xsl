<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:strip-space elements="*"/>
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:param name="filename"/>
    
    <xsl:template match="/">
        <html lang="fr">
            <head><xsl:call-template name="metadata-header"/></head>
            <body>
                <xsl:call-template name="sidebar"/> 
                <div class="main-wrapper">
                    <xsl:call-template name="navigation-bar"/>
                    <header>
                        <h1><xsl:value-of select="TEI/text/body/head"/></h1>
                        <p>Résumé du sujet</p>
                    </header>
                    <main>
                        <xsl:call-template name="generate-text-section"/>
                    </main>
                    <xsl:call-template name="footer"/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="metadata-header">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="description" content="A French translation of J.R.R. Tolkien poems"/>
        <meta name="author" content="J.R.R. Tolkien, translated by Lord Bijon"/>
        <meta name="keywords" content="poetry, fantasy, translation"/>
        <title><xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/title"/></title>
        <link rel="stylesheet" href="../CSS/FG_stylesheet.css"/>
        <script defer="" src="../JS/my_function2.js"/>
    </xsl:template>
    
    <xsl:template name="sidebar">
        <aside class="sidebar" id="mySidebar" aria-label="Menu principal">
            <a class="closebtn" href="#" onclick="closeNav()" aria-label="Fermer le menu">×</a>
            <ul>
                <li><a href="../index.html">Accueil</a></li>
                <li><a href="1_poeme.html">Poème à l'Anneau</a></li>
                <li><a href="2_prose.html">Définition de la TEI</a></li>
            </ul>
        </aside>
    </xsl:template>
    
    <xsl:template name="navigation-bar">
        <nav>
            <button class="openbtn" onclick="openNav()" aria-label="Ouvrir le menu de navigation" aria-expanded="false">☰ Navigation</button>
            <div class="download">
                <a href="../TEI/Encodage_po%C3%A8me_Exercice_0.2_corrig%C3%A9.xml" class="button" download="">[↓] XML-TEI</a>
                <a href="../my_document.pdf" class="button" target="_blank">[↓] PDF</a>
            </div>
        </nav>
    </xsl:template>
    
    <xsl:template name="generate-text-section">
        <xsl:for-each select="TEI/text/body/lg">
            <div class="content-wrapper">
                <section class="texte">
                    <h2><xsl:value-of select="head"/></h2>
                    <p>
                        <xsl:for-each select="l">
                            <span class="line-number"><xsl:value-of select="@n"/></span>
                            <xsl:value-of select="."/><br/>
                        </xsl:for-each>
                    </p>
                </section>
                <figure class="text-image">
                    <img src="{concat('../IMG/image_', @type, '_', @n,'.png')}" 
                        alt="{concat('image_', @type, '_', @n)}"/>
                    <figcaption/>
                </figure>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="footer">
        <footer>
            <section id="credits">
                <p><strong>Terms of Use and Citation:</strong> The citation terms are as follows: "citation dans le format désiré"</p>
                <p>Coding &amp; design: <a href="mailto:surname.name@domaine.ch">surname.name@domaine.ch</a></p>
            </section>
            <section id="logos">
                <figure class="logos-images">
                    <img src="../IMG/ihr_logo.png" alt="Logo IHR"/>
                    <img src="../IMG/SNF_logo.png" alt="Logo SNF"/>
                    <img src="../IMG/CUSO_logo.png" alt="Logo CUSO"/>
                </figure>
            </section>
        </footer>
    </xsl:template>
    
</xsl:stylesheet>
