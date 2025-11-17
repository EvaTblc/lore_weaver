# Nettoyage de la base de données
puts "🧹 Nettoyage de la base de données..."
Message.destroy_all
Game.destroy_all
Scenario.destroy_all
User.destroy_all

# Création d'un utilisateur
puts "👤 Création de l'utilisateur..."
user = User.create!(
  email: "eva@test.com",
  password: "password123",
  username: "eva_dev"
)

# Création des scénarios
puts "📚 Création des scénarios..."

scenario1 = Scenario.create!(
  name: "La Quête du Dragon",
  description: "Incarnez un(e) aventurier(ère) dans un royaume médiéval menacé par un dragon ancestral. Explorez des donjons, affrontez des créatures fantastiques et forgez votre légende.",
  prompt: "Tu es le maître du jeu pour une aventure médiévale fantasy. Le joueur incarne un aventurier courageux. Crée une histoire immersive avec des choix significatifs, des combats (utilise des jets de dés simples : 1-10 pour l'action), des énigmes et des rencontres avec des PNJ mémorables. Le ton est épique et les descriptions sont riches. Le dragon final doit être un défi majeur. Adapte la difficulté selon les actions du joueur.",
  active: true
)

scenario2 = Scenario.create!(
  name: "Meurtre à Londres",
  description: "1895, Londres. Un meurtre mystérieux secoue la haute société britannique. En tant que détective privé renommé, vous devez démêler les fils d'une intrigue complexe où rien n'est ce qu'il semble être.",
  prompt: "Tu es le maître du jeu pour une enquête policière victorienne. Le joueur est un détective privé expérimenté. Crée un mystère avec des indices subtils, des suspects avec des mobiles crédibles, des alibis à vérifier et des fausses pistes. L'atmosphère doit être mystérieuse et tendue. Le joueur doit pouvoir interroger des suspects, fouiller des lieux, analyser des indices. Maintiens la cohérence : les indices doivent mener logiquement au coupable. Révèle progressivement les informations.",
  active: true
)

scenario3 = Scenario.create!(
  name: "Odyssée Stellaire",
  description: "An 2847. Aux commandes du vaisseau Odysseus, explorez la galaxie, négociez avec des civilisations alien, gérez vos ressources et survivez aux dangers du vide spatial.",
  prompt: "Tu es le maître du jeu pour une aventure de science-fiction spatiale. Le joueur est capitaine d'un vaisseau d'exploration. Crée des situations variées : exploration de planètes inconnues, diplomatie avec des races aliens aux cultures étranges, combats spatiaux tactiques, gestion de ressources (carburant, vivres, munitions). Le ton est réaliste avec une touche d'émerveillement. Utilise des concepts scientifiques crédibles. Les choix du joueur doivent avoir des conséquences à long terme.",
  active: false  # Celui-ci est en test, pas encore actif
)

puts "✅ 3 scénarios créés (2 actifs, 1 en test)"

# Création de parties
puts "🎮 Création des parties..."

game1 = Game.create!(
  user: user,
  scenario: scenario1,
  name: "L'éveil du Dragon Rouge",
  character_name: "Aldric",
  status: :active,
  game_state: {
    health: 85,
    max_health: 100,
    inventory: ["épée en fer", "potion de soin", "carte du royaume"],
    location: "Taverne du Sanglier Doré",
    gold: 45,
    level: 2
  },
  story_summary: "Aldric, jeune aventurier, a accepté la quête du roi pour retrouver l'ancien temple où dort le Dragon Rouge. Après avoir vaincu des gobelins dans la forêt sombre, il a récupéré une carte ancienne et s'est réfugié à la taverne pour la nuit."
)

game2 = Game.create!(
  user: user,
  scenario: scenario2,
  name: "L'affaire Blackwood",
  character_name: "Inspecteur Blake",
  status: :active,
  game_state: {
    health: 100,
    max_health: 100,
    inventory: ["carnet de notes", "loupe", "badge de détective"],
    location: "Manoir Blackwood",
    gold: 0,
    level: 1
  },
  story_summary: "L'inspecteur Blake a été appelé au manoir Blackwood où Lord Edmund a été retrouvé mort dans son bureau. Trois suspects : Lady Blackwood (l'épouse), James (le majordome), et Victoria (la nièce héritière). Blake a commencé son enquête en examinant la scène de crime."
)

# Création de messages pour les parties
puts "💬 Création de messages pour les parties..."

Message.create!(
  game: game1,
  role: "assistant",
  content: "Bienvenue, Aldric ! Tu te réveilles dans ta chambre de la Taverne du Sanglier Doré. Le soleil matinal filtre à travers les volets. Ta quête pour retrouver le temple du Dragon Rouge commence aujourd'hui. Que fais-tu ?",
  token_count: 45
)

Message.create!(
  game: game1,
  role: "user",
  content: "Je descends à la taverne pour prendre un petit déjeuner et écouter les rumeurs locales.",
  token_count: 18
)

Message.create!(
  game: game1,
  role: "assistant",
  content: "Tu descends les escaliers grinçants. La salle commune est animée. Le tavernier, un homme rondouillard, te sert un copieux petit déjeuner. À une table voisine, tu entends deux marchands parler à voix basse : 'On dit que des créatures étranges rôdent près des ruines du nord... Personne n'en revient vivant.' Que fais-tu ?",
  token_count: 67
)

Message.create!(
  game: game2,
  role: "assistant",
  content: "Manoir Blackwood, 22 novembre 1895. Vous êtes l'inspecteur Blake, détective privé de renom. Le majordome James vous accueille, le visage grave. 'Lord Edmund a été retrouvé mort ce matin dans son bureau, Inspecteur. Nous n'avons touché à rien.' Il vous guide vers le lieu du crime. Que souhaitez-vous examiner en premier ?",
  token_count: 72
)

Message.create!(
  game: game2,
  role: "user",
  content: "J'examine le corps de Lord Edmund et les circonstances de sa mort.",
  token_count: 15
)

puts "✅ Messages créés pour les parties"

# Récapitulatif
puts "\n" + "="*50
puts "🎉 Seeds créées avec succès !"
puts "="*50
puts "👤 Utilisateur : #{user.email} (mot de passe: password123)"
puts "📚 Scénarios : #{Scenario.count} (#{Scenario.where(active: true).count} actifs)"
puts "🎮 Parties : #{Game.count}"
puts "💬 Messages : #{Message.count}"
puts "="*50
