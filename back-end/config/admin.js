const db = require("../models");
const bcrypt = require("bcryptjs");
// Fonction qui crée le compte admin dans la base de données à la connexion s'il n'existe pas
function setAdmin(req, res) {
  db.User.findOne({ where: { email: "admin@gmail.com" } || { pseudo: "Administrateur" } })
    .then((user) => {
      if (!user) {
        bcrypt
          .hash("Moderator", 10)
          .then((hash) => {
            const admin = db.User.create({
              pseudo: "Administrateur",
              email: "admin@gmail.com",
              password: hash,
              admin: true,
            })
              .then((admin) => {
                console.log({
                  admin,
                  message: `Votre compte administrateur est bien créé ${admin.pseudo} !`,
                });
              })
              .catch((error) => {
                res.status(400).json({ error });
              });
          })
          .catch((error) => {
            res.status(500).send({ error });
          });
      } else {
        console.log({ message: "l'administrateur est déjà créé" });
      }
    })
    .catch((error) => {
      console.log({ error });
    });
}
module.exports = setAdmin();