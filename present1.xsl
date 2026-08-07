<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <!--Καθορίζουμε το περιεχόμενο της κεφαλίδας-->
            <head>
                <title>Λίστα των Ζώων του Ζωολογικού Πάρκου</title>
            </head>
            <!--Καθορίζουμε το περιεχόμενο του κυρίους μέρους της σελίδας-->
            <body>
                <h2>Πίνακας Πληροφοριών Ζώων</h2>
                <!--Δημιουργούμε τον πίνακα-->
                <table border="2">
                    <tr>
                        <th>Όνομα Ζώου</th>
                        <th>Επιστημονική Ονομασία Ζώου</th>
                        <th>Πλήθος</th>
                        <th>Διάρκεια Ζωής σε Μήνες</th>
                        <th>Πληθυσμός στη Φύση</th>
                    </tr>
                    <!--Σύνδεση με το στοιχείο animal_list του zoo_park_new.xml και χρήση ένα στοιχείο animal τη φορά-->
                    <xsl:apply-templates select="zoo_park/animal_list/animal"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <!--Αρχίζουμε την διαδικασία εισαγωγής στοιχείων στον πίνακα-->
    <xsl:template match="animal">
        <!--Δημιουργούμε μία νέα γραμμή για κάθε ζώο και εκχωρούμε το κάθε δεδομένο που αφορά στο ζώο αυτο σε ένα νέο κελί-->
        <tr>
            <td><xsl:value-of select="animal_names_info/@animal_name"/></td>
            <td>
                <!--Εκτελούμε έλεγχο για το αν υπάρχει επιστημονική ονομασία του ζώου-->
                <xsl:choose>
                    <xsl:when test="animal_names_info/@scientific_name and animal_names_info/@scientific_name != ''">
                        <xsl:value-of select="animal_names_info/@scientific_name"/>
                    </xsl:when>
                    <xsl:otherwise>Δεν διατίθεται</xsl:otherwise>
                </xsl:choose>
            </td>
            <td><xsl:value-of select="quantity"/></td>
            <td>
                <!--Η διάρκεια ζωής των ζώων έχει αποθηκευτεί σε έτη στο zoo_park_new.xml οπότε πολλαπλασιάζουμε την τιμή επί 12-->
                <xsl:value-of select="animal_characteristics/lifetime * 12"/>
            </td>
            <td><xsl:value-of select="animal_characteristics/population"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>