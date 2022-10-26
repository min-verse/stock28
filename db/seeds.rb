# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "🌱 Seeding Stocks..."

# id:1
apple = Stock.create(ticker:"AAPL", name:"Apple", last_price:138.72, description:"Apple Inc. designs, manufactures, and markets smartphones, personal computers, tablets, wearables, and accessories worldwide. It also sells various related services. In addition, the company offers iPhone, a line of smartphones; Mac, a line of personal computers; iPad, a line of multi-purpose tablets; AirPods Max, an over-ear wireless headphone; and wearables, home, and accessories comprising AirPods, Apple TV, Apple Watch, Beats products, HomePod, and iPod touch. Further, it provides AppleCare support services; cloud services store services; and operates various platforms, including the App Store that allow customers to discover and download applications and digital content, such as books, music, video, games, and podcasts. Additionally, the company offers various services, such as Apple Arcade, a game subscription service; Apple Music, which offers users a curated listening experience with on-demand radio stations; Apple News+, a subscription news and magazine service; Apple TV+, which offers exclusive original content; Apple Card, a co-branded credit card; and Apple Pay, a cashless payment service, as well as licenses its intellectual property.")
# id:2
microsoft = Stock.create(ticker:"MSFT", name:"Microsoft", last_price:229.45, description:"Microsoft Corporation develops, licenses, and supports software, services, devices, and solutions worldwide. The company operates in three segments: Productivity and Business Processes, Intelligent Cloud, and More Personal Computing. The Productivity and Business Processes segment offers Office, Exchange, SharePoint, Microsoft Teams, Office 365 Security and Compliance, Microsoft Viva, and Skype for Business; Skype, Outlook.com, OneDrive, and LinkedIn; and Dynamics 365, a set of cloud-based and on-premises business solutions for organizations and enterprise divisions. The Intelligent Cloud segment licenses SQL, Windows Servers, Visual Studio, System Center, and related Client Access Licenses; GitHub that provides a collaboration platform and code hosting service for developers; Nuance provides healthcare and enterprise AI solutions; and Azure, a cloud platform.")
# id:3
google = Stock.create(ticker:"GOOG", name:"Alphabet", last_price:97.49, description:"Alphabet Inc. provides various products and platforms in the United States, Europe, the Middle East, Africa, the Asia-Pacific, Canada, and Latin America. It operates through Google Services, Google Cloud, and Other Bets segments. The Google Services segment offers products and services, including ads, Android, Chrome, hardware, Gmail, Google Drive, Google Maps, Google Photos, Google Play, Search, and YouTube. It is also involved in the sale of apps and in-app purchases and digital content in the Google Play store; and Fitbit wearable devices, Google Nest home products, Pixel phones, and other devices, as well as in the provision of YouTube non-advertising services. The Google Cloud segment offers infrastructure, platform, and other services; Google Workspace that include cloud-based collaboration tools for enterprises, such as Gmail, Docs, Drive, Calendar, and Meet; and other services for enterprise customers. The Other Bets segment sells health technology and internet services. The company was founded in 1998 and is headquartered in Mountain View, California.")
# id:4
tesla = Stock.create(ticker:"TSLA", name:"Tesla", last_price:207.99, description:"Tesla, Inc. designs, develops, manufactures, leases, and sells electric vehicles, and energy generation and storage systems in the United States, China, and internationally. The company operates in two segments, Automotive, and Energy Generation and Storage. The Automotive segment offers electric vehicles, as well as sells automotive regulatory credits. It provides sedans and sport utility vehicles through direct and used vehicle sales, a network of Tesla Superchargers, and in-app upgrades; and purchase financing and leasing services. This segment is also involved in the provision of non-warranty after-sales vehicle services, sale of used vehicles, retail merchandise, and vehicle insurance, as well as sale of products to third party customers; services for electric vehicles through its company-owned service locations, and Tesla mobile service technicians; and vehicle limited warranties and extended service plans.")
# id:5
exxon = Stock.create(ticker:"XOM", name:"Exxon Mobil", last_price:99.37, description:"Exxon Mobil Corporation explores for and produces crude oil and natural gas in the United States and internationally. It operates through Upstream, Downstream, and Chemical segments. The company is also involved in the manufacture, trade, transport, and sale of crude oil, natural gas, petroleum products, petrochemicals, and other specialty products; manufactures and sells petrochemicals, including olefins, polyolefins, aromatics, and various other petrochemicals; and captures and stores carbon, hydrogen, and biofuels. As of December 31, 2021, it had approximately 20,528 net operated wells with proved reserves. The company was founded in 1870 and is headquartered in Irving, Texas.")
# id:6
meta = Stock.create(ticker:"META", name:"Meta Platforms", last_price:127.50, description:"Meta Platforms, Inc. develops products that enable people to connect and share with friends and family through mobile devices, personal computers, virtual reality headsets, wearables, and in-home devices worldwide. It operates in two segments, Family of Apps and Reality Labs. The Family of Apps segment's products include Facebook, which enables people to share, discover, and connect with interests; Instagram, a community for sharing photos, videos, and private messages, as well as feed, stories, reels, video, live, and shops; Messenger, a messaging application for people to connect with friends, family, groups, and businesses across platforms and devices through chat, audio and video calls, and rooms; and WhatsApp, a messaging application that is used by people and businesses to communicate and transact privately. The Reality Labs segment provides augmented and virtual reality related products comprising virtual reality hardware, software, and content that help people feel connected, anytime, and anywhere. The company was formerly known as Facebook, Inc. and changed its name to Meta Platforms, Inc. in October 2021. Meta Platforms, Inc. was incorporated in 2004 and is headquartered in Menlo Park, California.")
# id:7
jpm = Stock.create(ticker:"JPM", name:"JPMorgan Chase", last_price:111.74, description:"JPMorgan Chase & Co. operates as a financial services company worldwide. It operates through four segments: Consumer & Community Banking (CCB), Corporate & Investment Bank (CIB), Commercial Banking (CB), and Asset & Wealth Management (AWM). The CCB segment offers s deposit, investment and lending products, payments, and services to consumers; lending, deposit, and cash management and payment solutions to small businesses; mortgage origination and servicing activities; residential mortgages and home equity loans; and credit card, auto loan, and leasing services. The CIB segment provides investment banking products and services, including corporate strategy and structure advisory, and equity and debt markets capital-raising services, as well as loan origination and syndication; payments and cross-border financing; and cash and derivative instruments, risk management solutions, prime brokerage, and research.")
# id:8
nvidia = Stock.create(ticker:"NVDA", name:"Nvidia", last_price:113.15, description:"NVIDIA Corporation provides graphics, and compute and networking solutions in the United States, Taiwan, China, and internationally. The company's Graphics segment offers GeForce GPUs for gaming and PCs, the GeForce NOW game streaming service and related infrastructure, and solutions for gaming platforms; Quadro/NVIDIA RTX GPUs for enterprise workstation graphics; vGPU software for cloud-based visual and virtual computing; automotive platforms for infotainment systems; and Omniverse software for building 3D designs and virtual worlds. Its Compute & Networking segment provides Data Center platforms and systems for AI, HPC, and accelerated computing; Mellanox networking and interconnect solutions; automotive AI Cockpit, autonomous driving development agreements, and autonomous vehicle solutions; cryptocurrency mining processors; Jetson for robotics and other embedded platforms; and NVIDIA AI Enterprise and other software.")
# id:9
bofa = Stock.create(ticker:"BAC", name:"Bank of America", last_price:31.72, description:"Bank of America Corporation, through its subsidiaries, provides banking and financial products and services for individual consumers, small and middle-market businesses, institutional investors, large corporations, and governments worldwide. Its Consumer Banking segment offers traditional and money market savings accounts, certificates of deposit and IRAs, noninterest-and interest-bearing checking accounts, and investment accounts and products; and credit and debit cards, residential mortgages, and home equity loans, as well as direct and indirect loans, such as automotive, recreational vehicle, and consumer personal loans. The company's Global Wealth & Investment Management segment offers investment management, brokerage, banking, and trust and retirement products and services; and wealth management solutions, as well as customized solutions, including specialty asset management services.")
# id:10
oracle = Stock.create(ticker:"ORCL", name:"Oracle", last_price:64.45, description:"Oracle Corporation offers products and services that address enterprise information technology environments worldwide. Its Oracle cloud software as a service offering include various cloud software applications, including Oracle Fusion cloud enterprise resource planning (ERP), Oracle Fusion cloud enterprise performance management, Oracle Fusion cloud supply chain and manufacturing management, Oracle Fusion cloud human capital management, Oracle Advertising, and NetSuite applications suite, as well as Oracle Fusion Sales, Service, and Marketing. The company also offers cloud-based industry solutions for various industries; Oracle application licenses; and Oracle license support services. In addition, it provides cloud and license business' infrastructure technologies, such as the Oracle Database, an enterprise database; Java, a software development language; and middleware, including development tools and others. The company's cloud and license business' infrastructure technologies also comprise cloud-based compute, storage, and networking capabilities; and Oracle autonomous database, MySQL HeatWave, Internet-of-Things, digital assistant, and blockchain.")
# id:11
salesforce = Stock.create(ticker:"CRM", name:"Salesforce", last_price:143.28, description:"Salesforce, Inc. provides customer relationship management technology that brings companies and customers together worldwide. Its Customer 360 platform empowers its customers to work together to deliver connected experiences for their customers. The company's service offerings include Sales to store data, monitor leads and progress, forecast opportunities, gain insights through analytics and relationship intelligence, and deliver quotes, contracts, and invoices; and Service that enables companies to deliver trusted and highly personalized customer service and support at scale. Its service offerings also comprise flexible platform that enables companies of various sizes, locations, and industries to build business apps to bring them closer to their customers with drag-and-drop tools; online learning platform that allows anyone to learn in-demand Salesforce skills; and Slack, a system of engagement.")
# id:12
cisco = Stock.create(ticker:"CSCO", name:"Cisco", last_price:40.14, description:"Cisco Systems, Inc. designs, manufactures, and sells Internet Protocol based networking and other products related to the communications and information technology industry in the Americas, Europe, the Middle East, Africa, the Asia Pacific, Japan, and China. The company also offers switching portfolio encompasses campus switching as well as data center switching; enterprise routing portfolio interconnects public and private wireline and mobile networks, delivering highly secure, and reliable connectivity to campus, data center and branch networks; wireless products include wireless access points that are standalone, controller appliance-based, switch-converged, and Meraki cloud-managed offerings; and compute portfolio including the cisco unified computing system, hyperflex, and software management capabilities, which combine computing, networking, and storage infrastructure management and virtualization.")
# id:13
comcast = Stock.create(ticker:"CMCSA", name:"Comcast", last_price:30.24, description:"Comcast Corporation operates as a media and technology company worldwide. It operates through Cable Communications, Media, Studios, Theme Parks, and Sky segments. The Cable Communications segment offers broadband, video, voice, wireless, and other services to residential and business customers under the Xfinity brand; and advertising services. The Media segment operates NBCUniversal's television and streaming platforms, including national, regional, and international cable networks, the NBC and Telemundo broadcast, and Peacock networks. The Studios segment operates NBCUniversal's film and television studio production and distribution operations.")
# id:14
adobe = Stock.create(ticker:"ADBE", name:"Adobe", last_price:288.70, description:"Adobe Inc. operates as a diversified software company worldwide. It operates through three segments: Digital Media, Digital Experience, and Publishing and Advertising. The Digital Media segment offers products, services, and solutions that enable individuals, teams, and enterprises to create, publish, and promote content; and Document Cloud, a unified cloud-based document services platform. Its flagship product is Creative Cloud, a subscription service that allows members to access its creative products. This segment serves content creators, workers, marketers, educators, enthusiasts, communicators, and consumers. The Digital Experience segment provides an integrated platform and set of applications and services that enable brands and businesses to create, manage, execute, measure, monetize, and optimize customer experiences from analytics to commerce. This segment serves marketers, advertisers, agencies, publishers, merchandisers, merchants, web analysts, data scientists, developers, and executives across the C-suite.")
# id:15
ibm = Stock.create(ticker:"IBM", name:"IBM", last_price:120.09, description:"International Business Machines Corporation provides integrated solutions and services worldwide. The company operates through four business segments: Software, Consulting, Infrastructure, and Financing. The Software segment offers hybrid cloud platform and software solutions, such as Red Hat, an enterprise open-source solutions; software for business automation, AIOps and management, integration, and application servers; data and artificial intelligence solutions; and security software and services for threat, data, and identity. This segment also provides transaction processing software that supports clients' mission-critical and on-premise workloads in banking, airlines, and retail industries.")
# id:16
amazon = Stock.create(ticker:"AMZN", name:"Amazon.com, Inc.", last_price:106.90, description:"Amazon.com, Inc. engages in the retail sale of consumer products and subscriptions in North America and internationally. The company operates through three segments: North America, International, and Amazon Web Services (AWS). It sells merchandise and content purchased for resale from third-party sellers through physical and online stores. The company also manufactures and sells electronic devices, including Kindle, Fire tablets, Fire TVs, Rings, and Echo and other devices; provides Kindle Direct Publishing, an online service that allows independent authors and publishers to make their books available in the Kindle Store; and develops and produces media content.")

puts "🌱 Seeding users..."
user1 = User.create(email:'joe@joe.com', password:'joe', first_name:'Joseph', last_name:'Patterson')
user2 = User.create(email:'bob@bob.com', password:'bob', first_name:'Robert', last_name:'Knightley')
user3 = User.create(email:'nor@nor.com', password:'nor', first_name:'Norbin', last_name:'Pearson')
user4 = User.create(email:'roger@roger.com', password:'roger', first_name:'Roger', last_name:'Stern')
user5 = User.create(email:'grant@grant.com', password:'grant', first_name:'Grant', last_name:'Morrison')

puts "🌱 Seeding UserStock associations..."
association1 = UserStock.create(user:user1,stock:apple)
association2 = UserStock.create(user:user1,stock:microsoft)
association3 = UserStock.create(user:user1,stock:google)
association4 = UserStock.create(user:user1,stock:amazon)
association5 = UserStock.create(user:user1,stock:nvidia)

association6 = UserStock.create(user:user2,stock:comcast)
association7 = UserStock.create(user:user2,stock:salesforce)
association8 = UserStock.create(user:user2,stock:adobe)
association9 = UserStock.create(user:user2,stock:jpm)
association10 = UserStock.create(user:user2,stock:meta)

association11 = UserStock.create(user:user3,stock:exxon)
association12 = UserStock.create(user:user3,stock:apple)
association13 = UserStock.create(user:user3,stock:bofa)
association14 = UserStock.create(user:user3,stock:cisco)
association15 = UserStock.create(user:user3,stock:tesla)

association16 = UserStock.create(user:user4,stock:microsoft)
association17 = UserStock.create(user:user4,stock:jpm)
association18 = UserStock.create(user:user4,stock:nvidia)
association19 = UserStock.create(user:user4,stock:amazon)
association20 = UserStock.create(user:user4,stock:adobe)

association21 = UserStock.create(user:user5,stock:bofa)
association22 = UserStock.create(user:user5,stock:ibm)
association23 = UserStock.create(user:user5,stock:amazon)
association24 = UserStock.create(user:user5,stock:tesla)
association25 = UserStock.create(user:user5,stock:salesforce)

puts "🌱 Seeding HistoricalStockDatum associations..."
# id:1 - AAPL
HistoricalStockDatum.record_data('AAPL')
# id:2 - MSFT
HistoricalStockDatum.record_data('MSFT')
# id:3 - GOOG
HistoricalStockDatum.record_data('GOOG')
# id:4 - TSLA
HistoricalStockDatum.record_data('TSLA')
# id:5 - XOM
HistoricalStockDatum.record_data('XOM')
# id:6 - META
HistoricalStockDatum.record_data('META')
# id:7 - JPM
HistoricalStockDatum.record_data('JPM')
# id:8 - NVDA
HistoricalStockDatum.record_data('NVDA')
# id:9 - BAC
HistoricalStockDatum.record_data('BAC')
# id:10 - ORCL
HistoricalStockDatum.record_data('ORCL')
# id:11 - CRM
HistoricalStockDatum.record_data('CRM')
# id:12 - CSCO
HistoricalStockDatum.record_data('CSCO')
# id:13 - CMCSA
HistoricalStockDatum.record_data('CMCSA')
# id:14 - ADBE
HistoricalStockDatum.record_data('ADBE')
# id:15 - IBM
HistoricalStockDatum.record_data('IBM')
# id:16 - AMZN
HistoricalStockDatum.record_data('AMZN')

puts "🌱 Seeding Friendship (following) associations..."

#user1 friendships
friendship1 = Friendship.create(user_id:1,following_id:2)
friendship2 = Friendship.create(user_id:1,following_id:3)
friendship3 = Friendship.create(user_id:1,following_id:4)

#user2 friendships
friendship4 = Friendship.create(user_id:2,following_id:3)
friendship5 = Friendship.create(user_id:2,following_id:4)
friendship6 = Friendship.create(user_id:2,following_id:5)

#user3 friendships
friendship7 = Friendship.create(user_id:3,following_id:4)
friendship8 = Friendship.create(user_id:3,following_id:5)
friendship9 = Friendship.create(user_id:3,following_id:1)

#user4 friendships
friendship10 = Friendship.create(user_id:4,following_id:5)
friendship11 = Friendship.create(user_id:4,following_id:1)
friendship12 = Friendship.create(user_id:4,following_id:2)

#user5 friendships
friendship13 = Friendship.create(user_id:5,following_id:1)
friendship14 = Friendship.create(user_id:5,following_id:2)
friendship15 = Friendship.create(user_id:5,following_id:3)

puts "Done Seeding! 🌱"