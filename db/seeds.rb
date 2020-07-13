files = ["./seeds/people.json", "./seeds/planets.json", "./seeds/starships.json"]

def convert_data(data)
    result = []
    data.each do |datum|
        result << OpenStruct.new(datum)
    end
    result
end

# Seeds

def seed_people(data)
    data.each do |person|
        Person.create(name: person.name, height: person.height, 
            mass: person.mass, hair_color: person.hair_color, 
            skin_color: person.skin_color, eye_color: person.eye_color, 
            birth_year: person.birth_year, gender: person.gender,
            films: person.films.length, vehicles: person.vehicles.length,
            starships: person.starships.length)
    end
end

def seed_planets(data)
    data.each do |planet|
        Planet.create(name: planet.name, rotation_period: planet.rotation_period, 
            orbital_period: planet.orbital_period, diameter: planet.diameter, 
            climate: planet.climate, gravity: planet.gravity, 
            terrain: planet.terrain, population: planet.population)
    end
end

def seed_starships(data)
    data.each do |starship|
        Starship.create(name: starship.name, model: starship.model,
            manufacturer: starship.manufacturer, hyperdrive_rating: starship.hyperdrive_rating,
            length: starship.length, max_atmosphering_speed: starship.max_atmosphering_speed,
            cargo_capacity: starship.cargo_capacity, crew: starship.crew,
            pilots: starship.pilots.length, passengers: starship.passengers)
    end
end

# Assign seed task to a method above
def assign_seed_handler(file_name, data)
    case file_name
    when "people"
        p "====== Seeding people table"
        seed_people(data)
        p "====== Seeding people table completed successfully"
    when "planets"
        p "====== Seeding planets table"
        seed_planets(data)
        p "====== Seeding planets table completed successfully"
    when "starships"
        p "====== Seeding starships table"
        seed_starships(data)
        p "====== Seeding planets table completed successfully"
    else
      "=== The file does not exist"
    end
end

files.each do |file|
    # holds the name of the file. E.g: file -> people.json => file_content -> "people"
    file_name = file.split("/").last.split(".").first

    # Load the file into this file
    path = File.join(File.dirname(__FILE__), file)

    # Parse file into a Hash and convert into an OpenStruct
    file_content = OpenStruct.new(JSON.parse(File.read(path))).data
    data = convert_data(file_content)
    assign_seed_handler(file_name, data)
end
