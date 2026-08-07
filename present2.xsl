<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!--Καθορίζουμε τη μορφή εξόδου σε HTML με κωδικοποίηση UTF-8 για τα ελληνικά-->
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <!--Ξεκινάμε το template που πιάνει τη ρίζα του XML αρχείου-->
    <xsl:template match="/">
        <html>
            <head>
                <title>Αλφαβητική Ταξινόμηση Ζώων</title>
            </head>
            <body>
                <!--Καθορίζουμε το περιεχόμενο του κυρίως μέρους της σελίδας-->
                <h2>2.7.b Ταξινόμηση Αλφαβητικά</h2>
                
                <!--Δημιουργούμε τον πίνακα δεδομένων-->
                <table border="1">
                    <thead>
                        <tr>
                            <th>Όνομα Ζώου</th>
                            <th>Επιστημονική Ονομασία</th>
                            <th>Ποσότητα</th>
                            <th>Διάρκεια Ζωής (Μήνες)</th>
                            <th>Πληθυσμός στη Φύση</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--Καλούμε τα δεδομένα των ζώων και τα ταξινομούμε αλφαβητικά ανά όνομα-->
                        <xsl:apply-templates select="zoo_park/animal_list/animal">
                            <xsl:sort select="animal_names_info/@animal_name" data-type="text" order="ascending"/>
                        </xsl:apply-templates>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <!--Template που εφαρμόζεται ξεχωριστά για κάθε ζώο (γραμμή πίνακα)-->
    <xsl:template match="animal">
        <tr>
            <!--Εμφάνιση του κοινού ονόματος του ζώου-->
            <td>
                <xsl:value-of select="animal_names_info/@animal_name"/>
            </td>
            
            <!--Έλεγχος και εμφάνιση της επιστημονικής ονομασίας-->
            <td>
                <xsl:choose>
                    <!--Αν η επιστημονική ονομασία υπάρχει και δεν είναι κενή, εμφάνισέ τη με πλάγια γράμματα-->
                    <xsl:when test="animal_names_info/@scientific_name and animal_names_info/@scientific_name != ''">
                        <i><xsl:value-of select="animal_names_info/@scientific_name"/></i>
                    </xsl:when>
                    <!--Αλλιώς, αν λείπει, εμφάνισε το μήνυμα Δεν διατίθεται-->
                    <xsl:otherwise>Δεν διατίθεται</xsl:otherwise>
                </xsl:choose>
            </td>
            
            <!--Εμφάνιση της ποσότητας των ζώων-->
            <td>
                <xsl:value-of select="quantity"/>
            </td>
            
            <!--Μετατροπή των χρόνων ζωής σε μήνες (πολλαπλασιάζουμε επί 12)-->
            <td>
                <xsl:value-of select="animal_characteristics/lifetime * 12"/>
            </td>
            
            <!--Εμφάνιση του πληθυσμού του ζώου στη φύση-->
            <td>
                <xsl:value-of select="animal_characteristics/population"/>
            </td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>