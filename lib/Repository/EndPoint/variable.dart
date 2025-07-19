import 'package:speedy/Model/Abonnement/Offre.dart';
import 'package:speedy/Model/Client.dart';
import 'package:speedy/Model/Commande/Commande.dart';
import 'package:speedy/Model/Commande/EtatCommande.dart';
import 'package:speedy/Model/Service/CategorieService.dart';
import 'package:speedy/Model/Service/Conception.dart';
import 'package:speedy/Model/Service/Couleur.dart';
import 'package:speedy/Model/Service/Dimension.dart';
import 'package:speedy/Model/Service/Faces.dart';
import 'package:speedy/Model/Service/Finition.dart';
import 'package:speedy/Model/Service/Format.dart';
import 'package:speedy/Model/Service/Forme.dart';
import 'package:speedy/Model/Service/Grammage.dart';
import 'package:speedy/Model/Service/Impression.dart';
import 'package:speedy/Model/Service/ModeImpression.dart';
import 'package:speedy/Model/Service/Service.dart';
import 'package:speedy/Model/Service/TypeConception.dart';
import 'package:speedy/Model/Service/TypePapier.dart';
import 'package:speedy/Model/chat/Message.dart';

Categorieservice categorieserviceVar = Categorieservice(1, "", "image");
Service serviceVar = Service(1, "", "", "", categorieserviceVar);
Client clientVar =
    Client(1, "nom", "password", "contact", "email", "bankCard", true);
EtatCommande etatCommandeVar = EtatCommande(1, "intitule");
ModeImpression modeImpressionVar =
    ModeImpression(1, "", "description", serviceVar!, 0, 1);
Dimension dimensionVar = Dimension(1, "intitule", "taille", serviceVar!, 0, 1);
Format formatVar = Format(1, "intitule", serviceVar!, 0, 1);
TypeConception typeConception = TypeConception(1, "intitule");
Conception conceptionVar = Conception(1, typeConception, 1000.0, serviceVar!);
Impression impressionVar = Impression(
    1,
    0,
    100,
    1000.0,
    serviceVar,
    modeImpressionVar,
    dimensionVar,
    formatVar,
    typePapierVar,
    facesVar,
    grammageVar,
    finitionVar,
    formesVar,
    couleurVar,
    0,
    1);

TypePapier typePapierVar = TypePapier(1, "intitule", serviceVar, 0, 1);
Grammage grammageVar = Grammage(1, "intitule", serviceVar, 0, 1);
Finition finitionVar = Finition(1, "intitule", serviceVar, 0, 1);
Forme formesVar = Forme(1, "intitule", serviceVar, 0, 1);
Faces facesVar = Faces(1, "intitule", serviceVar, 0, 1);
Couleur couleurVar = Couleur(1, "intitule", serviceVar, 0, 1);
Offre offre = Offre(1, "", 200, 1);
Message message = Message(1, "content", true, "localDate", clientVar);
Commande commandeVar = Commande(
    1,
    100,
    "dateLivraison",
    "dateCreation",
    true,
    "description",
    serviceVar,
    clientVar,
    etatCommandeVar,
    modeImpressionVar,
    dimensionVar,
    formatVar,
    conceptionVar,
    impressionVar,
    typePapierVar,
    facesVar,
    grammageVar,
    finitionVar,
    formesVar,
    couleurVar);
