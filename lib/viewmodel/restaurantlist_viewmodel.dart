import 'package:flutter/cupertino.dart';

import '../model/menumodel.dart';
import '../model/restaurantsmodel.dart';
import '../model/reviewmodel.dart';

class RestaurantListViewModel with ChangeNotifier {
  // List of random names

  final List<Restaurant> restaurants = [];

  RestaurantListViewModel() {
    [
      restaurants.addAll([
        Restaurant(
          id: '1',
          name: 'Khana Khazana',
          reviews: [
            Review(
                username: 'FoodLover123',
                comment: 'Absolutely delicious! Couldn t get enough.',
                date: DateTime.now()),
            Review(
                username: 'DiningDiva',
                comment:
                    'Decent food, but the service could use some improvement.',
                date: DateTime.now()),
            Review(
                username: 'CulinaryConnoisseur',
                comment:
                    'Exceptional quality and presentation. Highly recommended!',
                date: DateTime.now()),
            Review(
                username: 'Palatepleaser',
                comment:
                    'The menu had plenty of options to satisfy my cravings.',
                date: DateTime.now()),
            Review(
                username: 'GourmetGuru',
                comment:
                    'A true culinary experience. Every dish was a masterpiece.',
                date: DateTime.now()),
            Review(
                username: 'FlavourFanatic',
                comment: 'Flavors were bold and perfectly balanced. Impressed!',
                date: DateTime.now()),
            Review(
                username: 'DinnerDelight',
                comment: 'Enjoyed the cozy atmosphere and attentive staff.',
                date: DateTime.now()),
            Review(
                username: 'PlatePerfectionist',
                comment:
                    'Presentation was top-notc]h, but the taste fell short.',
                date: DateTime.now()),
            Review(
                username: 'CravingsCritic',
                comment: 'Disappointed with the lack of variety on the menu',
                date: DateTime.now()),
            Review(
                username: 'FoodieFinatic',
                comment: 'Consistently delicious. I keep coming back for more.',
                date: DateTime.now()),
            Review(
                username: 'DiningDuo',
                comment:
                    'Great for a date night. Romantic ambiance and wonderful food.',
                date: DateTime.now()),
            Review(
                username: 'CulinaryConnoisseur2',
                comment: 'Exceeded my expectations. A true hidden gem.',
                date: DateTime.now()),
            Review(
                username: 'PalatepleaseR',
                comment:
                    'The portions were a bit small, but the flavors made up for it.',
                date: DateTime.now()),
            Review(
                username: 'GourmetGuru2',
                comment:
                    'A masterful blend of textures and flavors. Impeccable!',
                date: DateTime.now()),
            Review(
                username: 'FlavourFanatic2',
                comment: 'The menu needs more vegetarian/vegan options.',
                date: DateTime.now()),
            Review(
                username: 'DinnerDelightful',
                comment: 'Loved the cozy atmosphere and attentive staff.',
                date: DateTime.now()),
            Review(
                username: 'PlatePerfectionist2',
                comment:
                    'Visually appealing, but the taste didn t quite match up.',
                date: DateTime.now()),
            Review(
                username: 'CravingsCritic2',
                comment: 'The menu lacked diversity and creativity.',
                date: DateTime.now()),
            Review(
                username: 'FoodieFinatic2',
                comment: 'Consistent quality, but I ve had better elsewhere.',
                date: DateTime.now()),
            Review(
                username: 'DiningDuo2',
                comment:
                    'Perfect for a special occasion. Romantic and delicious.',
                date: DateTime.now()),
            Review(
                username: 'CulinaryConnoisseur3',
                comment: 'Innovative dishes that showcased the chef s talent.',
                date: DateTime.now()),
            Review(
                username: 'PalatepleaseR2',
                comment:
                    'The portion sizes were just right, and the flavors were spot on.',
                date: DateTime.now()),
            Review(
                username: 'GourmetGuru3',
                comment:
                    'A true culinary masterpiece. Every bite was a delight.',
                date: DateTime.now()),
            Review(
                username: 'FlavourFanatic3',
                comment: 'The vegetarian options were surprisingly satisfying.',
                date: DateTime.now()),
            Review(
                username: 'DinnerDelightful2',
                comment:
                    'Cozy ambiance and impeccable service. Highly recommended.',
                date: DateTime.now()),
            Review(
                username: 'PlatePerfectionist3',
                comment:
                    'Beautifully presented, but the taste could use some refinement.',
                date: DateTime.now()),
            Review(
                username: 'CravingsCritic3',
                comment: 'The menu lacked creativity and originality.',
                date: DateTime.now()),
            Review(
                username: 'FoodieFinatic3',
                comment:
                    'Consistently good food, but nothing truly exceptional.',
                date: DateTime.now()),
            Review(
                username: 'DiningDuo3',
                comment:
                    'Perfect date night spot. Romantic setting and delectable dishes.',
                date: DateTime.now()),
            Review(
                username: 'CulinaryConnoisseur4',
                comment:
                    'Innovative and well-balanced flavors. A true delight.',
                date: DateTime.now()),
            Review(
                username: 'PalatepleaseR3',
                comment:
                    'The portion sizes were generous, and the flavors were divine.',
                date: DateTime.now()),
            Review(
                username: 'GourmetGuru4',
                comment:
                    'An outstanding culinary experience. Every dish was a masterpiece.',
                date: DateTime.now()),
            Review(
                username: 'FlavourFanatic4',
                comment:
                    'The menu had a great selection of vegetarian options.',
                date: DateTime.now()),
            Review(
                username: 'DinnerDelightful3',
                comment:
                    'Cozy ambiance, attentive staff, and delicious food. Loved it!',
                date: DateTime.now()),
            Review(
                username: 'PlatePerfectionist4',
                comment:
                    'Beautifully presented, but the taste wasn t quite up to par.',
                date: DateTime.now()),
            Review(
                username: 'CravingsCritic4',
                comment: 'The menu lacked diversity and failed to impress.',
                date: DateTime.now()),
            Review(
                username: 'FoodieFinatic4',
                comment:
                    'Solid food, but nothing truly memorable. Slightly overpriced.',
                date: DateTime.now()),
            Review(
                username: 'DiningDuo4',
                comment:
                    'Perfect for a special occasion. Romantic and delectable dishes.',
                date: DateTime.now()),
            Review(
                username: 'CulinaryConnoisseur5',
                comment:
                    'Exceptional flavors and innovative dishes. A true culinary delight.',
                date: DateTime.now()),
            Review(
                username: 'PalatepleaseR4',
                comment:
                    'The portion sizes were just right, and the flavors were outstanding.',
                date: DateTime.now()),
            Review(
                username: 'GourmetGuru5',
                comment:
                    'A culinary masterpiece from start to finish. Truly exceptional.',
                date: DateTime.now()),
            Review(
                username: 'FlavourFanatic5',
                comment:
                    'The menu had a great selection of vegetarian and vegan options.',
                date: DateTime.now()),
            Review(
                username: 'DinnerDelightful4',
                comment:
                    'Cozy ambiance, excellent service, and delectable dishes. Highly recommend.',
                date: DateTime.now()),
            Review(
                username: 'PlatePerfectionist5',
                comment:
                    'Beautifully presented, but the taste could use some refinement.',
                date: DateTime.now()),
            Review(
                username: 'CravingsCritic5',
                comment:
                    'The menu lacked diversity and failed to capture my interest.',
                date: DateTime.now()),
            Review(
                username: 'FoodieFinatic5',
                comment:
                    'Consistent quality, but not particularly memorable. Slightly overpriced.',
                date: DateTime.now()),
            Review(
                username: 'DiningDuo5',
                comment:
                    'Perfect for a romantic evening. Delectable dishes and cozy ambiance.',
                date: DateTime.now()),
            Review(
                username: 'CulinaryConnoisseur6',
                comment:
                    'Innovative and expertly crafted dishes. A true culinary delight.',
                date: DateTime.now()),
            Review(
                username: 'PalatepleaseR5',
                comment:
                    'The portion sizes were generous, and the flavors were divine.',
                date: DateTime.now()),
            Review(
                username: 'GourmetGuru6',
                comment:
                    'An outstanding dining experience from start to finish. Exceptional!',
                date: DateTime.now()),
            Review(
                username: 'FlavourFanatic6',
                comment:
                    'The menu catered well to my dietary needs. Impressed!',
                date: DateTime.now()),
            Review(
                username: 'DinnerDelightful5',
                comment:
                    'Cozy ambiance, attentive staff, and delicious food. Highly recommended.',
                date: DateTime.now()),
            Review(
                username: 'PlatePerfectionist6',
                comment:
                    'Beautifully presented, but the taste didn t quite meet my expectations.',
                date: DateTime.now()),
            Review(
                username: 'CravingsCritic6',
                comment:
                    'The menu lacked creativity and failed to excite my palate.',
                date: DateTime.now()),
            Review(
                username: 'FoodieFinatic6',
                comment:
                    'Solid food, but nothing truly remarkable. Slightly overpriced.',
                date: DateTime.now()),
            Review(
                username: 'DiningDuo6',
                comment:
                    'Perfect for a date night. Romantic ambiance and delectable dishes.',
                date: DateTime.now()),
            // More reviews
          ],
          menu: [
            MenuItem(
              name: 'Chicken Jalfrezi',
              description:
                  'Tender pieces of chicken cooked with bell peppers, onions, tomatoes, and a blend of spices, resulting in a colorful and flavorful dish.',
              imageUrl: 'assets/images/restaurantsone/chicken_jalfrezi.jpg',
              calories: 300,
              price: 12.99,
              fat: 15,
              protein: 25,
              category: 'Main Dishes',
              allergens: ['Gluten', 'Soy', 'Wheat', 'Eggs', 'Sulfites'],
              sodium: 700,
            ),
            MenuItem(
              name: 'Chicken Biryani',
              description:
                  'A fragrant rice dish cooked with marinated chicken, aromatic spices, and herbs.',
              imageUrl: 'assets/images/restaurantsone/Chicken_Biryani.jpg',
              calories: 400,
              fat: 15,
              protein: 20,
              sodium: 800,
              price: 14.99,
              category: 'Main Dishes',
              allergens: ['Gluten', 'Soy', 'Wheat', 'Eggs', 'Sulfites'],
            ),
            MenuItem(
              name: 'Seekh Kebab',
              description:
                  'Minced meat mixed with spices, shaped into skewers, and grilled.',
              imageUrl: 'assets/images/restaurantsone/chapli_kabab.jpg',
              calories: 200,
              price: 9.99,
              fat: 12,
              protein: 18,
              sodium: 300,
              category: 'Appetizers',
              allergens: ['Gluten', 'Soy', 'Wheat', 'Eggs', 'Sulfites'],
            ),
            MenuItem(
              name: 'Nihari',
              description:
                  'A slow-cooked stew made with tender beef or lamb, flavored with spices and served with naan.',
              imageUrl: 'assets/images/restaurantsone/Nihari.jpg',
              calories: 300,
              price: 13.99,
              fat: 20,
              protein: 25,
              sodium: 700,
              category: 'Main Dishes',
              allergens: ['Gluten', 'Soy', 'Beef', 'Wheat', 'Sulfites'],
            ),
            MenuItem(
              name: 'Haleem',
              description:
                  'A thick, savory porridge made with wheat, barley, lentils, and meat, slow-cooked with spices.',
              imageUrl: 'assets/images/restaurantsone/haleem.jpg',
              calories: 350,
              price: 11.99,
              fat: 10,
              protein: 15,
              sodium: 600,
              category: 'Main Dishes',
              allergens: ['Gluten', 'Soy', 'Beef', 'Wheat', 'Barley'],
            ),
            MenuItem(
              name: 'Aloo Palak',
              description:
                  'A vegetarian dish made with potatoes and spinach cooked together with spices.',
              imageUrl: 'assets/images/restaurantsone/aloo palak.jpg',
              calories: 200,
              price: 8.99,
              fat: 10,
              protein: 5,
              sodium: 400,
              category: 'Vegetarian',
              allergens: [],
            ),
            MenuItem(
              name: 'Chicken Karahi',
              description:
                  'Tender chicken cooked in a tomato-based gravy with spices, served with naan or rice.',
              imageUrl: 'assets/images/restaurantsone/chicken_karhai.jpg',
              calories: 300,
              price: 12.99,
              fat: 15,
              protein: 25,
              sodium: 700,
              category: 'Main Dishes',
              allergens: ['Gluten', 'Soy', 'Wheat', 'Eggs', 'Sulfites'],
            ),
            MenuItem(
              name: 'Sindhi Biryani',
              description:
                  'A spicy rice dish cooked with marinated meat, potatoes, and various spices.',
              imageUrl: 'assets/images/restaurantsone/sindhi_biryani.jpg',
              calories: 450,
              price: 15.99,
              fat: 20,
              protein: 25,
              sodium: 900,
              category: 'Main Dishes',
              allergens: ['Gluten', 'Soy', 'Beef', 'Wheat', 'Sulfites'],
            ),
            MenuItem(
              name: 'Daal Chawal',
              description:
                  'Lentils cooked with spices, served with steamed rice.',
              imageUrl: 'assets/images/restauranttwo/daal_chawal.jpg',
              calories: 250,
              price: 7.99,
              fat: 5,
              protein: 10,
              sodium: 500,
              category: 'Vegetarian',
              allergens: [],
            ),
            MenuItem(
              name: 'Saag Gosht',
              description:
                  'Tender mutton or beef cooked with spinach and spices.',
              imageUrl: 'assets/images/restaurantsone/saag_gosht.jpg',
              calories: 350,
              price: 14.99,
              fat: 15,
              protein: 20,
              sodium: 600,
              category: 'Main Dishes',
              allergens: ['Gluten', 'Soy', 'Mutton', 'Wheat', 'Sulfites'],
            ),
            MenuItem(
              name: 'Chicken Tikka',
              description:
                  'Marinated chicken pieces skewered and grilled, served with mint chutney.',
              imageUrl: 'assets/images/restaurantsone/chicken_tikka.jpg',
              calories: 250,
              price: 10.99,
              fat: 10,
              protein: 20,
              sodium: 400,
              category: 'Appetizers',
              allergens: ['Gluten', 'Soy', 'Wheat', 'Eggs', 'Sulfites'],
            ),
            MenuItem(
              name: 'Mutton Korma',
              description:
                  'Tender mutton cooked in a rich, creamy gravy with yogurt and spices.',
              imageUrl: 'assets/images/restaurantsone/mutton_korma.jpg',
              calories: 400,
              price: 15.99,
              fat: 25,
              protein: 20,
              sodium: 800,
              category: 'Main Dishes',
              allergens: ['Gluten', 'Soy', 'Mutton', 'Nuts', 'Sulfites'],
            ),
            MenuItem(
              name: 'Chicken Handi',
              description:
                  'Chicken cooked in a thick, creamy sauce, served in a traditional clay pot.',
              imageUrl: 'assets/images/restauranttwo/chicken_handi.jpg',
              calories: 350,
              price: 12.99,
              fat: 15,
              protein: 25,
              sodium: 700,
              category: 'Main Dishes',
              allergens: ['Gluten', 'Soy', 'Wheat', 'Eggs', 'Sulfites'],
            ),
            MenuItem(
              name: 'Palak Paneer',
              description: 'Paneer cubes cooked in a creamy spinach gravy.',
              imageUrl: 'assets/images/restaurantsone/palak_paneer.jpg',
              calories: 300,
              price: 11.99,
              fat: 20,
              protein: 15,
              sodium: 700,
              category: 'Vegetarian',
              allergens: ['Dairy', 'Soy', 'Wheat', 'Eggs', 'Sulfites'],
            ),
            MenuItem(
              name: 'Gulab Jamun',
              description:
                  'Soft dumplings made from milk solids soaked in sugar syrup.',
              imageUrl: 'assets/images/restaurantsone/gulab_jamun.jpg',
              calories: 250,
              price: 4.99,
              fat: 12,
              protein: 4,
              sodium: 30,
              category: 'Desserts',
              allergens: ['Milk', 'Tree nuts', 'Wheat', 'Soy', 'Sulfites'],
            ),
            MenuItem(
              name: 'Jalebi',
              description: 'Crisp spiral-shaped batter soaked in sugar syrup.',
              imageUrl: 'assets/images/restaurantsone/jalebi.jpg',
              calories: 200,
              price: 3.99,
              fat: 10,
              protein: 2,
              sodium: 25,
              category: 'Desserts',
              allergens: ['Wheat', 'Tree nuts', 'Milk', 'Eggs', 'Sesame'],
            ),
            MenuItem(
              name: 'Ras Malai',
              description:
                  'Soft cheese patties soaked in sweetened thickened milk.',
              imageUrl: 'assets/images/restaurantsone/ras_malai.jpg',
              calories: 300,
              price: 5.99,
              fat: 20,
              protein: 10,
              sodium: 25,
              category: 'Desserts',
              allergens: ['Milk', 'Tree nuts', 'Wheat', 'Soy', 'Cardamom'],
            ),
            // Add more MenuItems as needed
          ],
        ),
        Restaurant(
          id: '2',
          name: 'Pakistani Kitchen',
          reviews: [
            Review(
                username: 'FoodLover101',
                comment: 'Absolutely delicious, I ll be back!',
                date: DateTime.now()),
            Review(
                username: 'CookingEnthusiast',
                comment: 'The flavors were spot on, great job!',
                date: DateTime.now()),
            Review(
                username: 'TasteBudsTraveler',
                comment: 'Impressed by the authentic taste, loved it.',
                date: DateTime.now()),
            Review(
                username: 'FeastFinder',
                comment: 'Hands down the best biryani I ve tried in this city.',
                date: DateTime.now()),
            Review(
                username: 'PalateExplorer',
                comment: 'Truly a culinary delight, can t wait to come again.',
                date: DateTime.now()),
            Review(
                username: 'FlavourFanatic',
                comment: 'The spices were perfectly balanced, excellent job.',
                date: DateTime.now()),
            Review(
                username: 'CulinaryConnoisseur',
                comment: 'I was blown away by the depth of flavors, bravo!',
                date: DateTime.now()),
            Review(
                username: 'GourmetGuru',
                comment: 'This biryani sets a new standard, I m impressed.',
                date: DateTime.now()),
            Review(
                username: 'FoodieFinesse',
                comment:
                    'Absolutely delightful, I ll be recommending this place.',
                date: DateTime.now()),
            Review(
                username: 'TasteTraveler',
                comment:
                    'Authentic and delicious, a true delight for the senses.',
                date: DateTime.now()),
            Review(
                username: 'CravingsCritic',
                comment: 'This biryani exceeded my expectations, well done.',
                date: DateTime.now()),
            Review(
                username: 'PalatePerfecter',
                comment: 'Perfectly cooked, the flavors were simply divine.',
                date: DateTime.now()),
            Review(
                username: 'FlavourForager',
                comment: 'I could taste the love and care put into this dish.',
                date: DateTime.now()),
            Review(
                username: 'CulinaryConnoisseur2',
                comment: 'Easily the best biryani I ve had in this city.',
                date: DateTime.now()),
            Review(
                username: 'GourmetGuru2',
                comment: 'Mouth-watering and absolutely worth every bite.',
                date: DateTime.now()),
            Review(
                username: 'FoodieFinesse2',
                comment:
                    'I m still dreaming about the flavors, simply outstanding.',
                date: DateTime.now()),
            Review(
                username: 'TasteTraveler2',
                comment:
                    'A true culinary masterpiece, I m impressed beyond words.',
                date: DateTime.now()),
            Review(
                username: 'CravingsCritic2',
                comment: 'This biryani has set a new benchmark for excellence.',
                date: DateTime.now()),
            Review(
                username: 'PalatePerfecter2',
                comment: 'Perfectly cooked, the flavors were simply exquisite.',
                date: DateTime.now()),
            Review(
                username: 'FlavourForager2',
                comment:
                    'I could taste the passion and dedication in every bite.',
                date: DateTime.now()),
            Review(
                username: 'CulinaryConnoisseur3',
                comment: 'Hands down the best biryani I ve ever had, bravo!',
                date: DateTime.now()),
            Review(
                username: 'GourmetGuru3',
                comment:
                    'I m still savoring the incredible flavors, amazing job.',
                date: DateTime.now()),
            Review(
                username: 'FoodieFinesse3',
                comment: 'Absolutely captivating, I am lost for words.',
                date: DateTime.now()),
            Review(
                username: 'TasteTraveler3',
                comment: 'A true culinary revelation, I am in awe.',
                date: DateTime.now()),
            Review(
                username: 'CravingsCritic3',
                comment: 'This biryani has set a new standard for perfection.',
                date: DateTime.now()),
            Review(
                username: 'PalatePerfecter3',
                comment: 'The flavors were so well-balanced, simply stunning.',
                date: DateTime.now()),
            Review(
                username: 'FlavourForager3',
                comment:
                    'I could taste the dedication and expertise in every bite.',
                date: DateTime.now()),
            Review(
                username: 'CulinaryConnoisseur4',
                comment: 'Easily the best biryani I have ever had, bravo!',
                date: DateTime.now()),
            Review(
                username: 'GourmetGuru4',
                comment:
                    'I am still dreaming about the incredible flavors, amazing.',
                date: DateTime.now()),
            Review(
                username: 'FoodieFinesse4',
                comment: 'Absolutely captivating, I am left speechless.',
                date: DateTime.now()),
            Review(
                username: 'TasteTraveler4',
                comment: 'A true culinary masterpiece, I am in awe.',
                date: DateTime.now()),
            Review(
                username: 'CravingsCritic4',
                comment: 'This biryani has set a new benchmark for perfection.',
                date: DateTime.now()),
            Review(
                username: 'PalatePerfecter4',
                comment: 'The flavors were so well-balanced, simply divine.',
                date: DateTime.now()),
            Review(
                username: 'FlavourForager4',
                comment: 'I could taste the passion and skill in every bite.',
                date: DateTime.now()),
            Review(
                username: 'CulinaryConnoisseur5',
                comment: 'Easily the best biryani I have ever tasted, bravo!',
                date: DateTime.now()),
            Review(
                username: 'GourmetGuru5',
                comment:
                    'I am still dreaming about the incredible flavors, amazing work.',
                date: DateTime.now()),
            Review(
                username: 'FoodieFinesse5',
                comment: 'Absolutely captivating, I am left in awe.',
                date: DateTime.now()),
            Review(
                username: 'TasteTraveler5',
                comment: 'A true culinary masterpiece, I am blown away.',
                date: DateTime.now()),
            Review(
                username: 'CravingsCritic5',
                comment: 'This biryani has set a new benchmark for perfection.',
                date: DateTime.now()),
            Review(
                username: 'PalatePerfecter5',
                comment: 'The flavors were so well-balanced, simply exquisite.',
                date: DateTime.now()),
            Review(
                username: 'FlavourForager5',
                comment:
                    'I could taste the dedication and expertise in every bite.',
                date: DateTime.now()),
            Review(
                username: 'CulinaryConnoisseur6',
                comment: 'Easily the best biryani I have ever had, bravo!',
                date: DateTime.now()),
            Review(
                username: 'GourmetGuru6',
                comment:
                    'I am still savoring the incredible flavors, amazing job.',
                date: DateTime.now()),
            Review(
                username: 'FoodieFinesse6',
                comment: 'Absolutely captivating, I am lost for words.',
                date: DateTime.now()),
            Review(
                username: 'TasteTraveler6',
                comment: 'A true culinary revelation, I am in awe.',
                date: DateTime.now()),
            Review(
                username: 'CravingsCritic6',
                comment: 'This biryani has set a new standard for perfection.',
                date: DateTime.now()),
            Review(
                username: 'PalatePerfecter6',
                comment: 'The flavors were so well-balanced, simply stunning.',
                date: DateTime.now()),
            Review(
                username: 'FlavourForager6',
                comment:
                    'I could taste the dedication and expertise in every bite.',
                date: DateTime.now()),
            Review(
                username: 'CulinaryConnoisseur7',
                comment: 'Easily the best biryani I have ever had, bravo!',
                date: DateTime.now()),
            Review(
                username: 'GourmetGuru7',
                comment:
                    'I am still dreaming about the incredible flavors, amazing.',
                date: DateTime.now()),
            Review(
                username: 'FoodieFinesse7',
                comment: 'Absolutely captivating, I am left speechless.',
                date: DateTime.now()),
            Review(
                username: 'TasteTraveler7',
                comment: 'A true culinary masterpiece, I am in awe.',
                date: DateTime.now()),
            Review(
                username: 'CravingsCritic7',
                comment: 'This biryani has set a new benchmark for perfection.',
                date: DateTime.now()),
            Review(
                username: 'PalatePerfecter7',
                comment: 'The flavors were so well-balanced, simply divine.',
                date: DateTime.now()),
            Review(
                username: 'FlavourForager7',
                comment: 'I could taste the passion and skill in every bite.',
                date: DateTime.now()),
            Review(
                username: 'CulinaryConnoisseur8',
                comment: 'Easily the best biryani I have ever tasted, bravo!',
                date: DateTime.now()),
            Review(
                username: 'GourmetGuru8',
                comment:
                    'I am still dreaming about the incredible flavors, amazing work.',
                date: DateTime.now()),
            Review(
                username: 'FoodieFinesse8',
                comment: 'Absolutely captivating, I am left in awe.',
                date: DateTime.now()),
            Review(
                username: 'TasteTraveler8',
                comment: 'A true culinary masterpiece, I am blown away.',
                date: DateTime.now()),
            Review(
                username: 'CravingsCritic8',
                comment: 'This biryani has set a new benchmark for perfection.',
                date: DateTime.now()),
            Review(
                username: 'PalatePerfecter8',
                comment: 'The flavors were so well-balanced, simply exquisite.',
                date: DateTime.now()),
            Review(
                username: 'FlavourForager8',
                comment:
                    'I could taste the dedication and expertise in every bite.',
                date: DateTime.now())
            // More reviews
          ],
          menu: [
            MenuItem(
              name: 'Beef Biryani',
              description:
                  'Aromatic rice with tender beef pieces, spices, and herbs, cooked to perfection.',
              imageUrl: 'assets/images/restauranttwo/chicken_biryani.jpg',
              calories: 450,
              protein: 20,
              fat: 10,
              sodium: 800,
              price: 14.99,
              category: 'Main Course',
              allergens: [],
            ),
            MenuItem(
              name: 'Tandoori Delight (Chicken Biryani)',
              description:
                  'Marinate chicken in spices & yogurt, cook basmati rice & layer with chicken & spices.',
              imageUrl: 'assets/images/restauranttwo/chicken_biryani.jpg',
              calories: 400,
              protein: 18,
              fat: 8,
              sodium: 750,
              price: 12.99,
              category: 'Main Course',
              allergens: ['Gluten', 'Sulphites'],
            ),
            MenuItem(
              name: 'Slow-Cooked Stew (Nihari)',
              description:
                  'Marinate meat (beef/lamb) in spices & yogurt, slow-cooked with bone marrow.',
              calories: 500,
              protein: 25,
              fat: 15,
              sodium: 850,
              price: 16.99,
              imageUrl: 'assets/images/restauranttwo/nihari (2).jpg',
              category: 'Main Course',
              allergens: ['Gluten', 'Sulphites'],
            ),
            MenuItem(
              name: 'Spicy Chicken Fusion (Chicken Karahi)',
              description:
                  'Marinate chicken in spices & yogurt, cooked with tomatoes and spices.',
              calories: 350,
              protein: 22,
              fat: 10,
              sodium: 700,
              price: 13.99,
              imageUrl: 'assets/images/restauranttwo/chicken_karhai.jpg',
              category: 'Main Course',
              allergens: ['Gluten', 'Sulphites'],
            ),
            MenuItem(
              name: 'Spinach Potato Delight (Aloo Palak)',
              description:
                  'Boil potatoes & spinach, blend with garlic, ginger & spices.',
              calories: 200,
              protein: 5,
              fat: 6,
              sodium: 400,
              price: 10.99,
              imageUrl: 'assets/images/restauranttwo/aloo_palak.jpg',
              category: 'Main Course',
              allergens: [],
            ),
            MenuItem(
              name: 'Hearty Stew (Haleem)',
              description:
                  'Mix wheat, barley, lentils & meat, cooked slowly with spices.',
              calories: 400,
              protein: 20,
              fat: 12,
              sodium: 750,
              price: 14.99,
              imageUrl: 'assets/images/restauranttwo/haleem (1).jpg',
              category: 'Main Course',
              allergens: ['Gluten', 'Sulphites'],
            ),
            MenuItem(
              name: 'Sindhi Spice Rice (Sindhi Biryani)',
              description:
                  'Marinate meat in spices & yogurt, cooked with basmati rice.',
              calories: 450,
              protein: 22,
              fat: 10,
              sodium: 800,
              price: 15.99,
              imageUrl: 'assets/images/restauranttwo/sindhi_biryani.jpg',
              category: 'Main Course',
              allergens: ['Gluten', 'Sulphites'],
            ),
            MenuItem(
              name: 'Lentil Rice Bowl (Daal Chawal)',
              description: 'Boil lentils & rice, add spices & ghee.',
              calories: 300,
              protein: 10,
              fat: 8,
              sodium: 600,
              price: 9.99,
              imageUrl: 'assets/images/restauranttwo/daal_chawal.jpg',
              category: 'Main Course',
              allergens: [],
            ),
            MenuItem(
              name: 'Spinach Meat Curry (Saag Gosht)',
              description: 'Cook meat in spinach gravy with spices.',
              calories: 400,
              protein: 25,
              fat: 12,
              sodium: 750,
              price: 14.99,
              imageUrl: 'assets/images/restauranttwo/saag_gosht.jpg',
              category: 'Main Course',
              allergens: ['Gluten', 'Sulphites'],
            ),
            MenuItem(
              name: 'Mutton Korma Delight',
              description:
                  'Marinate meat in yogurt & spices, cooked in creamy gravy.',
              calories: 500,
              protein: 22,
              fat: 20,
              sodium: 850,
              price: 17.99,
              imageUrl: 'assets/images/restauranttwo/mutton_korma.jpg',
              category: 'Main Course',
              allergens: ['Gluten', 'Sulphites', 'Tree Nuts'],
            ),
            MenuItem(
              name: 'Veggie Rice Medley (Veg Pulao)',
              description: 'Cook mixed veggies & basmati rice with spices.',
              calories: 250,
              protein: 6,
              fat: 5,
              sodium: 500,
              price: 10.99,
              imageUrl: 'assets/images/restauranttwo/veg_pulao.jpg',
              category: 'Main Course',
              allergens: [],
            ),
            MenuItem(
              name: 'Clay Pot Chicken',
              description:
                  'Marinate chicken in spices & yogurt, cooked in clay pot.',
              calories: 350,
              protein: 20,
              fat: 10,
              sodium: 700,
              price: 13.99,
              imageUrl: 'assets/images/restauranttwo/chicken_handi.jpg',
              category: 'Main Course',
              allergens: ['Gluten', 'Sulphites'],
            ),
            MenuItem(
              name: 'Meat Potato Curry (Aloo Gosht)',
              description:
                  'Cook meat & potatoes in spicy gravy with garlic & ginger.',
              calories: 400,
              protein: 22,
              fat: 12,
              sodium: 750,
              price: 14.99,
              imageUrl: 'assets/images/restauranttwo/aloo_gosht.jpg',
              category: 'Main Course',
              allergens: ['Gluten', 'Sulphites'],
            ),
            MenuItem(
              name: 'Meatball Curry (Nargisi Kofta)',
              description: 'Mix meat with spices & eggs, cooked in gravy.',
              imageUrl: 'assets/images/restauranttwo/nargisi_kofta.jpg',
              calories: 400,
              protein: 22,
              fat: 12,
              sodium: 750,
              price: 15.99,
              category: 'Main Course',
              allergens: ['Gluten', 'Sulphites', 'Eggs'],
            ),
            MenuItem(
              name: 'Gulab Jamun',
              description: 'Deep fried milk dough balls soaked in rose syrup.',
              calories: 300,
              protein: 5,
              fat: 10,
              sodium: 150,
              price: 5.99,
              imageUrl: 'assets/images/restauranttwo/gulab_jamun.jpg',
              category: 'Dessert',
              allergens: [],
            ),
            MenuItem(
              name: 'Jalebi',
              description: 'Deep fried fermented batter soaked in sugar syrup.',
              calories: 300,
              protein: 3,
              fat: 12,
              sodium: 100,
              price: 4.99,
              imageUrl: 'assets/images/restauranttwo/jalebi (1).jpg',
              category: 'Dessert',
              allergens: [],
            ),
            MenuItem(
              name: 'Ras Malai',
              description:
                  'Paneer soaked in cream & sugar, flavored with cardamom.',
              calories: 350,
              protein: 8,
              fat: 15,
              sodium: 200,
              price: 6.99,
              imageUrl: 'assets/images/restauranttwo/ras_malai.jpg',
              category: 'Dessert',
              allergens: [],
            ),
            MenuItem(
              name: 'Sohan Halwa',
              description: 'Wheat flour & ghee, flavored with nuts & cardamom.',
              calories: 300,
              protein: 5,
              fat: 12,
              sodium: 150,
              price: 5.99,
              imageUrl: 'assets/images/restauranttwo/sohan_halwa.jpg',
              category: 'Dessert',
              allergens: [],
            ),
            MenuItem(
              name: 'Gajar Ka Halwa',
              description:
                  'Grated carrots cooked in milk, flavored with cardamom.',
              calories: 250,
              protein: 5,
              fat: 10,
              sodium: 150,
              price: 5.99,
              imageUrl: 'assets/images/restauranttwo/gajar_ka_halwa.jpg',
              category: 'Dessert',
              allergens: [],
            ),
            MenuItem(
              name: 'Sheer Khurma',
              description: 'Vermicelli cooked in milk with sugar & cardamom.',
              calories: 300,
              protein: 6,
              fat: 12,
              sodium: 150,
              price: 5.99,
              imageUrl: 'assets/images/restauranttwo/sheer_khurma.jpg',
              category: 'Dessert',
              allergens: [],
            ),
            MenuItem(
              name: 'Fresh Limeade',
              description: 'Classic summer drink with a sweet and tangy twist.',
              calories: 50,
              protein: 0,
              fat: 0,
              sodium: 10,
              price: 3.99,
              imageUrl: 'assets/images/restauranttwo/fresh_lemonade.jpg',
              category: 'Beverage',
              allergens: [],
            ),
            MenuItem(
              name: 'Chai (Milk Tea)',
              description: 'Traditional spiced tea with milk and sugar.',
              calories: 150,
              protein: 4,
              fat: 6,
              sodium: 50,
              price: 2.99,
              imageUrl: 'assets/images/restauranttwo/iced_lemon_tea.jpg',
              category: 'Beverage',
              allergens: ['Milk'],
            ),
            MenuItem(
              name: 'Mint Margarita',
              description: 'Refreshing drink with mint and lemon.',
              calories: 70,
              protein: 0,
              fat: 0,
              sodium: 15,
              price: 4.99,
              imageUrl:
                  'assets/images/restauranttwo/cocumber_mint_refresher.jpg',
              category: 'Beverage',
              allergens: [],
            ),
          ],
        ),
        Restaurant(
          id: '3',
          name: 'Spice Oasis',
          reviews: [
            Review(
                username: 'HappyCustomer1',
                comment: 'Fantastic experience, highly recommend!',
                date: DateTime.now()),
            Review(
                username: 'FoodLover2',
                comment: 'The food was absolutely delicious!',
                date: DateTime.now()),
            Review(
                username: 'EfficientService3',
                comment: 'The staff was incredibly helpful and efficient.',
                date: DateTime.now()),
            Review(
                username: 'CozyAmbience4',
                comment: 'The atmosphere was warm and inviting.',
                date: DateTime.now()),
            Review(
                username: 'SatisfiedVisitor5',
                comment: 'I ll definitely be coming back.',
                date: DateTime.now()),
            Review(
                username: 'PleasedGuest6',
                comment: 'Exceeded my expectations in every way.',
                date: DateTime.now()),
            Review(
                username: 'DelightedDiner7',
                comment: 'The presentation of the dishes was beautiful.',
                date: DateTime.now()),
            Review(
                username: 'ImaginativeMenu8',
                comment: 'The menu had a great variety of options.',
                date: DateTime.now()),
            Review(
                username: 'GraciousHost9',
                comment: 'The owner was very welcoming and friendly.',
                date: DateTime.now()),
            Review(
                username: 'SatisfiedCustomer10',
                comment: 'I had an overall fantastic experience.',
                date: DateTime.now()),
            Review(
                username: 'HappyVisitor11',
                comment: 'I ll definitely be recommending this place.',
                date: DateTime.now()),
            Review(
                username: 'ImpressedGuest12',
                comment: 'The service was prompt and attentive.',
                date: DateTime.now()),
            Review(
                username: 'PleasedPatron13',
                comment: 'The ambiance was warm and inviting.',
                date: DateTime.now()),
            Review(
                username: 'SatisfiedDiner14',
                comment: 'The menu had a great variety of options.',
                date: DateTime.now()),
            Review(
                username: 'DelightedCustomer15',
                comment: 'The presentation of the dishes was excellent.',
                date: DateTime.now()),
            Review(
                username: 'EnthuisasticFoodie16',
                comment: 'The flavors were perfectly balanced.',
                date: DateTime.now()),
            Review(
                username: 'GratefulVisitor17',
                comment: 'The staff went above and beyond.',
                date: DateTime.now()),
            Review(
                username: 'PleasedCustomer18',
                comment: 'I can t wait to come back.',
                date: DateTime.now()),
            Review(
                username: 'SatisfiedDiner19',
                comment: 'The ambiance was perfect for a special occasion.',
                date: DateTime.now()),
            Review(
                username: 'DelightedPatron20',
                comment: 'The menu had something for everyone.',
                date: DateTime.now()),
            Review(
                username: 'HappyGuest21',
                comment: 'Exceptional service and delicious food.',
                date: DateTime.now()),
            Review(
                username: 'ImaginativeMenu22',
                comment: 'The presentation was truly impressive.',
                date: DateTime.now()),
            Review(
                username: 'GraciousHost23',
                comment: 'The owner was very attentive and hospitable.',
                date: DateTime.now()),
            Review(
                username: 'SatisfiedVisitor24',
                comment: 'I had an amazing time.',
                date: DateTime.now()),
            Review(
                username: 'PleasedGuest25',
                comment: 'The food was absolutely delectable.',
                date: DateTime.now()),
            Review(
                username: 'DelightedDiner26',
                comment: 'The atmosphere was perfect for a relaxing evening.',
                date: DateTime.now()),
            Review(
                username: 'HappyCustomer27',
                comment: 'I ll definitely be back soon.',
                date: DateTime.now()),
            Review(
                username: 'FoodLover28',
                comment: 'The menu had a great variety of options.',
                date: DateTime.now()),
            Review(
                username: 'EfficientService29',
                comment: 'The staff was incredibly attentive and efficient.',
                date: DateTime.now()),
            Review(
                username: 'CozyAmbience30',
                comment: 'The ambiance was warm and inviting.',
                date: DateTime.now()),
            Review(
                username: 'SatisfiedCustomer31',
                comment: 'I had an exceptional experience.',
                date: DateTime.now()),
            Review(
                username: 'HappyVisitor32',
                comment: 'The presentation of the dishes was outstanding.',
                date: DateTime.now()),
            Review(
                username: 'ImpressedGuest33',
                comment: 'The owner was very friendly and accommodating.',
                date: DateTime.now()),
            Review(
                username: 'PleasedPatron34',
                comment: 'I will definitely be recommending this place.',
                date: DateTime.now()),
            Review(
                username: 'SatisfiedDiner35',
                comment: 'The flavors were perfectly balanced and delicious.',
                date: DateTime.now()),
            Review(
                username: 'DelightedCustomer36',
                comment: 'The service was prompt and attentive.',
                date: DateTime.now()),
            Review(
                username: 'EnthuisasticFoodie37',
                comment: 'The menu had a great selection of unique dishes.',
                date: DateTime.now()),
            Review(
                username: 'GratefulVisitor38',
                comment: 'The atmosphere was perfect for a special occasion.',
                date: DateTime.now()),
            Review(
                username: 'PleasedCustomer39',
                comment: 'I had an overall fantastic experience.',
                date: DateTime.now()),
            Review(
                username: 'SatisfiedDiner40',
                comment: 'The staff was incredibly friendly and helpful.',
                date: DateTime.now()),
            Review(
                username: 'DelightedPatron41',
                comment: 'The presentation of the dishes was truly impressive.',
                date: DateTime.now()),
            Review(
                username: 'HappyGuest42',
                comment: 'I will definitely be coming back.',
                date: DateTime.now()),
            Review(
                username: 'ImaginativeMenu43',
                comment: 'The menu had a great variety of options.',
                date: DateTime.now()),
            Review(
                username: 'GraciousHost44',
                comment: 'The owner was very welcoming and attentive.',
                date: DateTime.now()),
            Review(
                username: 'SatisfiedVisitor45',
                comment: 'The food was absolutely delicious.',
                date: DateTime.now()),
            Review(
                username: 'PleasedGuest46',
                comment: 'The atmosphere was warm and inviting.',
                date: DateTime.now()),
            Review(
                username: 'DelightedDiner47',
                comment: 'The service was prompt and efficient.',
                date: DateTime.now()),
            Review(
                username: 'HappyCustomer48',
                comment: 'I had an exceptional dining experience.',
                date: DateTime.now()),
            Review(
                username: 'FoodLover49',
                comment: 'The presentation of the dishes was beautiful.',
                date: DateTime.now()),
            Review(
                username: 'EfficientService50',
                comment: 'The staff was incredibly helpful and attentive.',
                date: DateTime.now()),
            Review(
                username: 'CozyAmbience51',
                comment: 'The ambiance was perfect for a relaxing evening.',
                date: DateTime.now()),
            Review(
                username: 'SatisfiedCustomer52',
                comment: 'I ll definitely be recommending this place.',
                date: DateTime.now()),
            Review(
                username: 'HappyVisitor53',
                comment: 'The menu had a great selection of unique dishes.',
                date: DateTime.now()),
            Review(
                username: 'ImpressedGuest54',
                comment: 'The owner was very friendly and hospitable.',
                date: DateTime.now()),
            Review(
                username: 'PleasedPatron55',
                comment: 'The flavors were perfectly balanced and delicious.',
                date: DateTime.now()),
            Review(
                username: 'SatisfiedDiner56',
                comment: 'The service was prompt and attentive.',
                date: DateTime.now()),
            Review(
                username: 'DelightedCustomer57',
                comment: 'The atmosphere was perfect for a special occasion.',
                date: DateTime.now()),
            Review(
                username: 'EnthuisasticFoodie58',
                comment: 'I had an overall fantastic experience.',
                date: DateTime.now()),
            Review(
                username: 'GratefulVisitor59',
                comment: 'The staff was incredibly friendly and helpful.',
                date: DateTime.now()),
            Review(
                username: 'PleasedCustomer60',
                comment: 'The presentation of the dishes was truly impressive.',
                date: DateTime.now())
            // More reviews
          ],
          menu: [
            MenuItem(
              name: 'Paneer Tikka',
              description:
                  'Grilled paneer chunks marinated in yogurt and spices, served with mint chutney.',
              imageUrl: 'assets/images/restauranttwo/paneer_ikka.jpg',
              calories: 250,
              price: 10.99,
              fat: 10,
              protein: 20,
              sodium: 400,
              category: 'Appetizer',
              allergens: ['Dairy'],
            ),
            MenuItem(
              name: 'Cucumber Mint Refresher',
              description: 'Light and refreshing, perfect for hot days.',
              calories: 90,
              protein: 0,
              fat: 0,
              sodium: 20,
              price: 2.49,
              imageUrl:
                  'assets/images/restauranttwo/cocumber_mint_refresher.jpg',
              category: 'Beverage',
              allergens: [],
            ),
            MenuItem(
              name: 'Samosas',
              description:
                  'Fried pastry pockets filled with spiced potatoes and peas.',
              calories: 200,
              price: 5.99,
              fat: 19,
              protein: 18,
              sodium: 8,
              imageUrl: 'assets/images/restauranttwo/samosas.jpg',
              category: 'Appetizer',
              allergens: ['Gluten'],
            ),
            MenuItem(
              name: 'Tandoori Delight (Chicken Biryani)',
              description:
                  'Marinate chicken in spices & yogurt, cook basmati rice & layer with chicken & spices.',
              imageUrl: 'assets/images/restauranttwo/chicken_biryani.jpg',
              calories: 400,
              protein: 18,
              fat: 8,
              sodium: 750,
              price: 12.99,
              category: 'Main Course',
              allergens: ['Gluten', 'Sulphites'],
            ),
            MenuItem(
              name: 'Gulab Jamun',
              imageUrl: 'assets/images/restauranttwo/gulab_jamun.jpg',
              description: 'Deep fried milk dough balls soaked in rose syrup.',
              calories: 300,
              protein: 5,
              fat: 10,
              sodium: 150,
              price: 5.99,
              category: 'Dessert',
              allergens: [],
            ),
            MenuItem(
              name: 'Spicy Chicken Fusion (Chicken Karahi)',
              description: 'Marinated chicken cooked with tomatoes and spices.',
              calories: 350,
              price: 13.99,
              protein: 22,
              fat: 10,
              sodium: 700,
              imageUrl: 'assets/images/restauranttwo/chicken_karhai.jpg',
              category: 'Main Course',
              allergens: ['Gluten', 'Sulphites'],
            ),
            MenuItem(
              name: 'Fresh Fruit Smoothie',
              description:
                  'Blended fruity goodness with strawberries and bananas.',
              calories: 200,
              price: 3.99,
              protein: 2,
              fat: 1,
              sodium: 40,
              imageUrl: 'assets/images/restauranttwo/fresh_fruit_smoothie.jpg',
              category: 'Beverage',
              allergens: [],
            ),
            MenuItem(
              name: 'Hearty Stew (Haleem)',
              description:
                  'Mix of wheat, barley, lentils & meat, slow-cooked with spices.',
              calories: 400,
              price: 14.99,
              protein: 20,
              fat: 12,
              sodium: 750,
              imageUrl: 'assets/images/restauranttwo/haleem (1).jpg',
              category: 'Main Course',
              allergens: ['Gluten', 'Sulphites'],
            ),
            MenuItem(
              name: 'Mutton Korma Delight',
              description: 'Marinated mutton cooked in creamy gravy with nuts.',
              calories: 500,
              protein: 22,
              fat: 20,
              sodium: 850,
              price: 17.99,
              imageUrl: 'assets/images/restauranttwo/mutton_korma.jpg',
              category: 'Main Course',
              allergens: ['Gluten', 'Sulphites', 'Tree Nuts'],
            ),
            // Add more MenuItems
          ],
        )
      ])
    ];
  }
}
