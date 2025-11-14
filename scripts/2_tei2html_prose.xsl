<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:strip-space elements="*"/>
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <!-- Template principal : noeud-racine et structure du html-->
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="metadata-haeder"/>
            </head>
            <body>
                <xsl:call-template name="sidebar"/>
                <div class="main-wrapper">
                    <xsl:call-template name="navigation-bar"/>
                    <header>
                        <h1><xsl:value-of select="TEI/text/body/head"/></h1>
                        <p>abstract du sujet</p>
                    </header>
                    <main>
                        <xsl:apply-templates select="TEI/text/body/div"/>
                    </main>
                    <xsl:call-template name="footer"/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    
    <!-- metadata -->
    <xsl:template name="metadata-haeder">
       <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
       <meta name="description" content="Burnard, Lou. Qu’est-ce que la Text Encoding Initiative ?. Traduit par Marjorie Burghart, OpenEdition Press, 2015, https://doi.org/10.4000/books.oep.1237."/>
       <meta name="author" content="Burnard, Lou traduit par Marjorie Burghart"/>
       <meta name="keywords" content="Edition digitale, TEI, XML"/>
        <title><xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/title"/></title>
        <link rel="stylesheet" href="../CSS/FG_stylesheet.css"/>
        <script defer="" src="../JS/my_function2.js"></script>
    </xsl:template>
    
    <!-- Sidebar -->
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
    
    <!-- Navigation -->
    <xsl:template name="navigation-bar">
        <nav>
            <button class="openbtn" onclick="openNav()" aria-label="Ouvrir le menu de navigation">☰ Navigation</button>
            <div class="download">
                <a href="../TEI/Encodage_prose_Exercice_0.1_corrig%C3%A9.xml" class="button" download="">[↓] XML-TEI</a>
                <a href="../my_document.pdf" class="button" target="_blank">[↓] PDF</a>
            </div>
        </nav>
    </xsl:template>
    
    <!-- Texte -->
    <xsl:template match="div">
        <div class="content-wrapper">
            <section class="texte" id="{concat(@type, '_', @n)}">
                <h2><xsl:value-of select="head"/></h2>
                <xsl:apply-templates select="p"/>
            </section>
            <figure class="text-image">
                <img src="" alt="{concat('image_', @type, '_', @n)}"/>
                <figcaption/>
            </figure>
        </div>
    </xsl:template>
    
    <!-- Paragraphe -->
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <!-- Gestion de l'italique -->
    <xsl:template match="hi">
        <strong><em><xsl:value-of select="."/></em></strong>
    </xsl:template>
    
    <!-- Pied de page -->
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
