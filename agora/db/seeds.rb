Rails.application.eager_load!
ApplicationRecord.descendants.each { |model|
  # unless model == User
    model.delete_all
    ActiveRecord::Base.connection.reset_pk_sequence!(model.table_name)
    puts "La table #{model.table_name} est supprimée"
  # end
}

@Paris = City.create!(name: "Paris", zip_code: "75000")
@Lyon = City.create!(name: "Lyon", zip_code: "69000")
@Marseille = City.create!(name: "Marseille", zip_code: "13000")
@Bordeaux = City.create!(name: "Bordeaux", zip_code: "33000")
@Reims =City.create!(name: "Reims", zip_code: "51100")
@Rouen = City.create!(name: "Rouen", zip_code: "76000")
@Toulouse = City.create!(name: "Toulouse", zip_code: "31500")
@Angers = City.create!(name: "Angers", zip_code: "49000")
@Montpellier = City.create!(name: "Montpellier", zip_code: "34000")
@Nice = City.create!(name: "Nice", zip_code: "06000")
@Nantes = City.create!(name: "Nantes", zip_code: "44000")
@Lille = City.create!(name: "Lille", zip_code: "59000")
@Grenoble = City.create!(name: "Grenoble", zip_code: "38000")
@Dijon = City.create!(name: "Dijon", zip_code: "21000")

puts "Les villes ont été créées"

# 10.times do 
#   User.create!(
#     first_name: Faker::Name.first_name, 
#     last_name: Faker::Name.last_name,
#     city: City.all.sample,
#     email: Faker::Internet.email,
#     password: "ririri"
#   )
# end

puts "Les utilisateurs ont été créées"

@Ecologie = Category.create!(name: "Ecologie")
@Mobilité = Category.create!(name: "Mobilité")
@Education = Category.create!(name: "Education")
@Santé = Category.create!(name: "Santé")
@Sport = Category.create!(name: "Sport")
@Société = Category.create!(name: "Société")

puts "Les catégories ont été créées"

Proposal.create!(title: "Un parking pour tous", 
  purpose: "Construction d'un parking pour personnes à mobilité réduite", 
  description: "Construire un parking supplémentaire pour les personnes à mobilité réduite près de la grande avenue. Prévoir au moins 30 places.",
  is_online: true,
  city: @Nantes,
  category: @Mobilité,
  user: User.all.sample
)

Proposal.create!(title: "Travaux terrain de tennis Roseraie de Nantes", 
  purpose: "Restaurer le terrain de tennis qui a subi des intempéris", 
  description: "Les récents intempéris ont eu raion du terrain, et surtout du sol. Il est difficile de jouer dans de bonnes conditions. Je propose la restauration bénévole de ce terrain afin qu'il soit de nouveau pratiquable. Votez pour cette proposition si cela vous intéresse, et joignez-vous à moi pour les travaux.",
  is_online: true,
  city: @Nantes,
  category: @Sport,
  user: User.all.sample
)

Proposal.create!(title: "Travaux terrain de Tennis du Lac Kir", 
  purpose: "Restaurer le terrain de tennis qui a subi des intempéris", 
  description: "Les récents intempéris ont eu raion du terrain, et surtout du sol. Il est difficile de jouer dans de bonnes conditions. Je propose la restauration bénévole de ce terrain afin qu'il soit de nouveau pratiquable. Votez pour cette proposition si cela vous intéresse, et joignez-vous à moi pour les travaux.",
  is_online: true,
  city: @Dijon,
  category: @Sport,
  user: User.all.sample
)

Proposal.create!(title: "Un arbre dans le parc", 
  purpose: "Plantation d'un arbre dans le parc des enfants", 
  description: "Le grand arbre du parc a récemment été retiré du parc car il était malade. Donnons un nouveau souffle à ce parc et plantons un nouvel arbre, les enfants appréieront.",
  is_online: true,
  city: @Dijon,
  category: @Ecologie,
  user: User.all.sample
)

Proposal.create!(title: "Potager commun", 
  purpose: "Création d'un potager commun pour la résidence du Lac", 
  description: "Certains résidents du Lac ont emmis l'idée de créer un potager commun pour toute la résidence. Il existe une petite parcelle exploitable pour ce petit projet.",
  is_online: true,
  city: @Dijon,
  category: @Ecologie,
  user: User.all.sample
)

Proposal.create!(title: "Non au trottinettes électriques", 
  purpose: "Abandon de la mise en place des parking pour trottinettes électriques", 
  description: "Comme vous le savez, les trottinettes vont faire leur apparition dans notre ville. Certains d'entre nous ont pu constaster les dégâts que celles-ci génèrent. Aussi, nous demandons l'abandon immédiat de ce projet afin de préserver notre ville.",
  is_online: true,
  city: @Toulouse,
  category: @Société,
  user: User.all.sample
)

Proposal.create!(title: "Potager commun", 
  purpose: "Création d'un potager commun pour la résidence des Colombes", 
  description: "Certains résidents des Colombes ont emmis l'idée de créer un potager commun pour toute la résidence. Il existe une petite parcelle exploitable pour ce petit projet.",
  is_online: true,
  city: @Toulouse,
  category: @Ecologie,
  user: User.all.sample
)

Proposal.create!(title: "Fête du cassoulet", 
  purpose: "Fête du cassoulet Toulousain et petit stand de dégustation", 
  description: "Célébrons ce plat emblématique de notre région autour de dégustations et de revisites",
  is_online: true,
  city: @Toulouse,
  category: @Société,
  user: User.all.sample
)

Proposal.create!(title: "Distribution de masques", 
  purpose: "Distribution de masques confectionnés par nos habitants", 
  description: "Je propose un petit stand de distribution de masques confectionnés par nos habitans. Prix : 0,50 centimes. Tout sera reversé à la ville.",
  is_online: true,
  city: @Toulouse,
  category: @Société,
  user: User.all.sample
) 

Proposal.create!(title: "Distribution de masques", 
  purpose: "Distribution de masques confectionnés par nos habitants", 
  description: "Je propose un petit stand de distribution de masques confectionnés par nos habitans. Prix : 0,50 centimes. Tout sera reversé à la ville.",
  is_online: true,
  city: @Reims,
  category: @Société,
  user: User.all.sample
) 

Proposal.create!(title: "Potager commun", 
  purpose: "Création d'un potager commun pour la résidence des Herbiers", 
  description: "Certains résidents des Herbiers ont emmis l'idée de créer un potager commun pour toute la résidence. Il existe une petite parcelle exploitable pour ce petit projet.",
  is_online: true,
  city: @Reims,
  category: @Ecologie,
  user: User.all.sample
)

Proposal.create!(title: "Distribution de gel hydroalcoolique", 
  purpose: "Distribution de gel hydroalcoolique gratuite", 
  description: "Plusieurs tubes de gel hydroalcoolique ont été donné à ma société. Disposant d'un nombre suffisant, je porpose de faire une distribution à la mairie, gratuite. Les gels seront limités à un habitant pour éviter tout abus.",
  is_online: true,
  city: @Montpellier,
  category: @Santé,
  user: User.all.sample
)

Proposal.create!(title: "Spectacle du printemps", 
  purpose: "Une petite représentation de nos danseurs du club Comédie", 
  description: "Le club Comédie vous propose une petite représenation de danse Place de la Comédie, le 30 Août 2020. L'occasion de vous faire découvrir notre univers et de célébrer la fin de l'été.",
  is_online: true,
  city: @Montpellier,
  category: @Société,
  user: User.all.sample
)

Proposal.create!(title: "Distribution de gel hydroalcoolique", 
  purpose: "Distribution de gel hydroalcoolique gratuite", 
  description: "Plusieurs tubes de gel hydroalcoolique ont été donné à ma société. Disposant d'un nombre suffisant, je porpose de faire une distribution à la mairie, gratuite. Les gels seront limités à un habitant pour éviter tout abus.",
  is_online: true,
  city: @Paris,
  category: @Santé,
  user: User.all.sample
)

Proposal.create!(title: "Potager commun", 
  purpose: "Création d'un potager commun pour la résidence des Bouleaux", 
  description: "Certains résidents des Bouleaux ont emmis l'idée de créer un potager commun pour toute la résidence. Il existe une petite parcelle exploitable pour ce petit projet.",
  is_online: true,
  city: @Paris,
  category: @Ecologie,
  user: User.all.sample
)

Proposal.create!(title: "Spectacle du printemps", 
  purpose: "Une petite représentation de nos danseurs du club Etoile", 
  description: "Le club Etoile vous propose une petite représenation de danse dans la rue du Marais, le 30 Août 2020. L'occasion de vous faire découvrir notre univers et de célébrer la fin de l'été.",
  is_online: true,
  city: @Paris,
  category: @Société,
  user: User.all.sample
)

Proposal.create!(title: "Ravalement de façade du bâtiment George V", 
  purpose: "Ravalement de façade du bâtiment George V, dont l'état est très dégradé.", 
  description: "Le bâtiment George V se dégrade très vite, il faut y remédier. Je propose que la mairie prenne en charge les frais de ces travaux car ce bâtiment est emblématique et le ravalement aurait du être fait il y a des années.",
  is_online: true,
  city: @Paris,
  category: @Société,
  user: User.all.sample
)

Proposal.create!(title: "Nettoyage du lac de Paladru", 
  purpose: "Nettoyage collectif des alentours du lac de Paladru", 
  description: "Nous proposons des sessions de nettoyages colelctifs des alentours du lac de Paladru régulières afin de préserver notre nature.",
  is_online: true,
  city: @Grenoble,
  category: @Ecologie,
  user: User.all.sample
)

Proposal.create!(title: "Fermeture permanente des écoles", 
  purpose: "Ne pas réouvrir les écoles suite aux annonces du gouvernement", 
  description: "La réouverture des écoles représente un vrai danger pour nos enfants et pour nous mêmes. Votons contre! ",
  is_online: true,
  city: @Grenoble,
  category: @Santé,
  user: User.all.sample
)

Proposal.create!(title: "Dépistage covid-19", 
  purpose: "Dépistage covid-19 pour tous", 
  description: "Aménagement d'un stand pour dépister en masse le coronavirus et contrer la maladie. Respectons les gestes barrières.",
  is_online: true,
  city: @Grenoble,
  category: @Santé,
  user: User.all.sample
)

Proposal.create!(title: "Fermeture permanente des écoles", 
  purpose: "Ne pas réouvrir les écoles suite aux annonces du gouvernement", 
  description: "La réouverture des écoles représente un vrai danger pour nos enfants et pour nous mêmes. Votons contre! ",
  is_online: true,
  city: @Rouen,
  category: @Santé,
  user: User.all.sample
)

Proposal.create!(title: "Distribution de gel hydroalcoolique", 
  purpose: "Distribution de gel hydroalcoolique gratuite", 
  description: "Plusieurs tubes de gel hydroalcoolique ont été donné à ma société. Disposant d'un nombre suffisant, je porpose de faire une distribution à la mairie, gratuite. Les gels seront limités à un habitant pour éviter tout abus.",
  is_online: true,
  city: @Rouen,
  category: @Santé,
  user: User.all.sample
)

Proposal.create!(title: "Fermeture permanente des écoles", 
  purpose: "Ne pas réouvrir les écoles suite aux annonces du gouvernement", 
  description: "La réouverture des écoles représente un vrai danger pour nos enfants et pour nous mêmes. Votons contre! ",
  is_online: true,
  city: @Bordeaux,
  category: @Santé,
  user: User.all.sample
)

Proposal.create!(title: "Non aux pesticides dans les vignobles", 
  purpose: "Les pesticides sont de plus en plus présents dans nos vins, sans que nous nous rendions comtpe.", 
  description: "Plusieurs débats ont déjà eu lieu à ce sujet, sans rien donner. Il faut que nous agissions. Nous pouvons lancer une pétition afin de réguler la présence des pesticdes dans nos vignobles.  ",
  is_online: true,
  city: @Bordeaux,
  category: @Santé,
  user: User.all.sample
)

Proposal.create!(title: "Nettoyage des calanques", 
  purpose: "Nettoyage collectif des calanques de Marseille", 
  description: "Nous proposons des sessions régulières de nettoyages colelctifs des alentours des calanques afin de préserver notre patrimoine.",
  is_online: true,
  city: @Marseille,
  category: @Ecologie,
  user: User.all.sample
)

Proposal.create!(title: "Aménagement d'un terrain de pétanque", 
  purpose: "Aménagement d'un terrain de pétanque dans le 2ème arrondissement", 
  description: "De plus en plus d'adeptes de la pétanque à Marseille, mais pas plus de terrain ! Aménageons un terrain (ou plus) afin de pallier à ce manque",
  is_online: true,
  city: @Marseille,
  category: @Sport,
  user: User.all.sample
)

Proposal.create!(title: "Piste cyclable", 
  purpose: "Aménagement d'une piste cyclable à la Préfecture ", 
  description: "Difficile de circuler sur le même trottoir que les piétons pour les cyclistes ! Mettons en place un piste prévu à cet effet.",
  is_online: true,
  city: @Marseille,
  category: @Mobilité,
  user: User.all.sample
)

Proposal.create!(title: "Contre la construction de l'usine Pétrochimique", 
  purpose: "L'usine Pétrochimique prévoit de s'implanter en Anjou, mobilisons nous...", 
  description: "L'usine Pétrochimique prévoit de s'implanter en Anjou, mobilisons nous ! La politique écologique de cette usine va à l'encontre de nos principes. Il est urgent de préserver nos terres. Pour cela, il faut créer une pétition.",
  is_online: true,
  city: @Angers,
  category: @Ecologie,
  user: User.all.sample
)

Proposal.create!(title: "Piste cyclable", 
  purpose: "Aménagement d'une piste cyclable à la Roseraie ", 
  description: "Difficile de circuler sur le même trottoir que les piétons pour les cyclistes ! Mettons en place un piste prévu à cet effet.",
  is_online: true,
  city: @Angers,
  category: @Mobilité,
  user: User.all.sample
)

Proposal.create!(title: "Indroduction au language des signes en classe de primaire", 
  purpose: "Donner des cours de language des signes en classe de primaire afin de sensibiliser les plus jeunes", 
  description: "Cette démarche consiste à sensibiliser les plus jeunes à l'handicap et de favoriser l'intégration des enfants sourds et muets. Une demie heure y serait consacrée chaque semaine.",
  is_online: true,
  city: @Nice,
  category: @Education,
  user: User.all.sample
)

Proposal.create!(title: "Don du sang", 
  purpose: "Collecte de sang à la mairie, tous les mois", 
  description: "Face à la crise du coronavirus, les hôpitaux ont du mobiliser beaucoup de ressources. Aidons les en donnant notre sang, pour sauver plus de vie et anticiper une nouvelle crise.",
  is_online: true,
  city: @Nice,
  category: @Santé,
  user: User.all.sample
)

Proposal.create!(title: "Indroduction au language des signes en classe de primaire", 
  purpose: "Donner des cours de language des signes en classe de primaire afin de sensibiliser les plus jeunes", 
  description: "Cette démarche consiste à sensibiliser les plus jeunes à l'handicap et de favoriser l'intégration des enfants sourds et muets. Une demie heure y serait consacrée chaque semaine.",
  is_online: true,
  city: @Nantes,
  category: @Education,
  user: User.all.sample
)

Proposal.create!(title: "Don du sang", 
  purpose: "Collecte de sang à la mairie, tous les mois", 
  description: "Face à la crise du coronavirus, les hôpitaux ont du mobiliser beaucoup de ressources. Aidons les en donnant notre sang, pour sauver plus de vie et anticiper une nouvelle crise.",
  is_online: true,
  city: @Nantes,
  category: @Santé,
  user: User.all.sample
)

Proposal.create!(title: "Distribution de gel hydroalcoolique", 
  purpose: "Distribution de gel hydroalcoolique gratuite", 
  description: "Plusieurs tubes de gel hydroalcoolique ont été donné à ma société. Disposant d'un nombre suffisant, je porpose de faire une distribution à la mairie, gratuite. Les gels seront limités à un habitant pour éviter tout abus.",
  is_online: true,
  city: @Nantes,
  category: @Santé,
  user: User.all.sample
)

Proposal.create!(title: "Indroduction au language des signes en classe de primaire", 
  purpose: "Donner des cours de language des signes en classe de primaire afin de sensibiliser les plus jeunes", 
  description: "Cette démarche consiste à sensibiliser les plus jeunes à l'handicap et de favoriser l'intégration des enfants sourds et muets. Une demie heure y serait consacrée chaque semaine.",
  is_online: true,
  city: @Lyon,
  category: @Education,
  user: User.all.sample
)

Proposal.create!(title: "Cinéma plein air à Bellcour", 
  purpose: "Cinéma plein air à Bellcour, sur la place", 
  description: "Que diriez-vous d'implanter des séances de cinéma en pleine air sur la place de Bellecour? Projection sur un grand écran et entrer à un euros",
  city: @Lyon,
  category: @Société,
  user: User.all.sample
)

Proposal.create!(title: "Piste pour les joggeurs", 
  purpose: "Création d'une piste pour joggeurs à la Confluence pour plus de sécurité", 
  description: "Il n'existe pas de piste pour les joggeurs, qui sont très nombreux dans le quartier. Certains se retrouvent sur la route ou bien les pites cyclables. Il y a eu plusieurs légèrs accidents et nous pourrions prévenir ce genre d'incident. ",
  is_online: true,
  city: @Lyon,
  category: @Sport,
  user: User.all.sample
)

Proposal.create!(title: "Indroduction au language des signes en classe de primaire", 
  purpose: "Donner des cours de language des signes en classe de primaire afin de sensibiliser les plus jeunes", 
  description: "Cette démarche consiste à sensibiliser les plus jeunes à l'handicap et de favoriser l'intégration des enfants sourds et muets. Une demie heure y serait consacrée chaque semaine.",
  is_online: true,
  city: @Lille,
  category: @Education,
  user: User.all.sample
)

Proposal.create!(title: "Tournoi inter-collèges : compétition de basket", 
  purpose: "Organisation d'un tournoi de basket, opposant les diffèrents collèges de Lille", 
  description: "Cette initiative est proposée par plusieurs collèges Lillois. Le tournai pourrait avoir lieu dans le gymanse place Sébastopol est accueillir 1000 spectateurs.",
  is_online: true,
  city: @Lille,
  category: @Sport,
  user: User.all.sample
)

Proposal.create!(title: "Dépistage COVID-19", 
  purpose: "Dépistage gratuit pour les Lillois au COVID-19", 
  description: "Foyer de l'épidémie, controns la maladie en déspistant massivement nos habitants !",
  is_online: true,
  city: @Lille,
  category: @Santé,
  user: User.all.sample
)

puts "Les propositions ont été créées"

50.times do
  user = User.all.sample
  proposal = Proposal.all.sample
  if !proposal.vote_of(user) && user.city == proposal.city
    Vote.create!(
      user: User.all.sample,
      proposal: Proposal.all.sample
    )
  end
end

puts "Les votes ont été créés"

200.times do 
  Comment.create!(
    content: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
    user: User.all.sample,
    proposal: Proposal.all.sample
  )
end

100.times do
  Comment.create(
    content: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
    user: User.all.sample,
    comment: Comment.all.sample
  )
end

puts "Les commentaires ont été créés"

200.times do
  user = User.all.sample
  comment = Comment.all.sample
  if comment.not_liked_by?(user) && comment.isnt_comment_comment?
    Like.create!(
      user: User.all.sample,
      comment: Comment.all.sample
    )
  end
end

puts "Les likes ont été créés"