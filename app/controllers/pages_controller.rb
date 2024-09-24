require 'mercadopago'

class PagesController < ApplicationController
  def home
    if params["dark-mode"] == "on"
      @dark_mode = "dark"
    else
      @dark_mode = nil
    end

    if params["partner"].present?
      @partner = params["partner"]
    end

    @bootcamps = [
      {
        "name": 'Desarrollo Web & AI',
        "hours": 400,
        "price": 5500,
        "description": 'Conviértete en desarrollador de software y construye aplicaciones web desde la base de datos hasta la interfaz de usuarios.',
        "icon": '<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />
          </svg>',
        "syllabus": "https://drive.google.com/file/d/1wbwNRlwUmiieUhmrZ9y35u-g_3mL5dnv/view",
        "link": "https://www.lewagon.com/es/apply?program_slug=web",
        "restriction": "requiere entrevista"
      },
      {
        "name": 'Data Science & IA',
        "hours": 400,
        "price": 5500,
        "description": 'Aprende las habilidades de un científico de datos y construye tus propios productos de inteligencia artificial desde cero.',
        "icon": '<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z" />
          </svg>',
        "syllabus": "https://drive.google.com/file/d/1uOv-vmD8HBssuQH8Be2qHfwnTumpAWaS/view",
        "link": "https://www.lewagon.com/es/apply?program_slug=data",
        "restriction": "requiere entrevista"
      },
      {
        "name": 'Data Analytics & AI',
        "hours": 400,
        "price": 5500,
        "description": 'Desde la recopilación de datos hasta su visualización, adquiere todos los conocimientos técnicos y de negocio necesarios para iniciar una carrera exitosa como analista de datos.',
        "icon": '<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
          </svg>',
        "syllabus": "https://drive.google.com/file/d/1YRcNNsTFzHTmsmJyQ151v-cz2XG-UDTZ/view",
        "link": "https://www.lewagon.com/es/apply?program_slug=data_analytics",
        "restriction": "requiere entrevista"
      }
    ]
    @courses = [
      {
        "name": 'Webflow',
        "hours": 40,
        "price": 800,
        "description": 'Imagina y crea tu propia página web de la A a la Z sin tener que programar.',
        "icon": '<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4" />
          </svg>',
        "syllabus": "https://drive.google.com/file/d/1kBzHaX9vggS6Cwfw5Mba5RDeCmck0XlF/view",
        "link": "https://start.lewagon.com/catalog",
        "restriction": "sincrónico",
        "success": "https://learn.lewagon.com/onboarding?secure_token=710a23028e151c1eca5d19323e89b04c",
      },
      {
        "name": 'Data Analytics Essentials',
        "hours": 40,
        "price": 800,
        "description": 'Gana autonomía en el uso de los datos gracias a SQL, Google Data Studio y Google Sheets, y aprende a realizar análisis basados en datos corporativos reales.',
        "icon": '<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4" />
          </svg>',
        "syllabus": "https://drive.google.com/file/d/1kBzHaX9vggS6Cwfw5Mba5RDeCmck0XlF/view",
        "link": "https://start.lewagon.com/catalog",
        "restriction": "sincrónico",
        "success": "https://learn.lewagon.com/onboarding?secure_token=710a23028e151c1eca5d19323e89b04c",
      },
      {
        "name": 'Data Analytics con Power BI',
        "hours": 60,
        "price": 800,
        "description": 'Optimiza el procesamiento de grandes bases de datos para la toma de decisiones con el dominio de Excel y Power BI.',
        "icon": '<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4" />
          </svg>',
        "syllabus": "https://drive.google.com/file/d/1kBzHaX9vggS6Cwfw5Mba5RDeCmck0XlF/view",
        "link": "https://start.lewagon.com/catalog",
        "restriction": "sincrónico",
        "success": "https://learn.lewagon.com/onboarding?secure_token=710a23028e151c1eca5d19323e89b04c",
      }
    ]
    @async = [
      {
        "name": 'UX and UI Design',
        "hours": 24,
        "price": 200,
        "description": 'Aprende a construir prototipos de productos digitales entendiendo cómo se aplican la experiencia de Usuario y el diseño de las interfaces. Aprenderás sobre Figma y Analytics.',
        "icon": '<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4" />
          </svg>',
        "syllabus": "https://drive.google.com/file/d/1kBzHaX9vggS6Cwfw5Mba5RDeCmck0XlF/view",
        "link": "https://start.lewagon.com/catalog",
        "restriction": "asincrónico",
        "success": "https://learn.lewagon.com/onboarding?secure_token=710a23028e151c1eca5d19323e89b04c",
      },
      {
        "name": 'Intro a Desarrollo Web',
        "hours": 24,
        "price": 200,
        "description": 'Este programa busca darle la introducción al desarrollo de plataforma web. Durante el programa aprenderás sobre HTML, CSS, JavaScript, Ruby, Figma, Git, y la terminal.',
        "icon": '<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4" />
          </svg>',
        "syllabus": "https://drive.google.com/file/d/1kBzHaX9vggS6Cwfw5Mba5RDeCmck0XlF/view",
        "link": "https://start.lewagon.com/catalog",
        "restriction": "asincrónico",
        "success": "https://learn.lewagon.com/onboarding?secure_token=710a23028e151c1eca5d19323e89b04c",
      },
      {
        "name": 'Intro a Análisis de Datos',
        "hours": 24,
        "price": 200,
        "description": 'Adquieres los conocimientos necesarios para poder analizar datos y tranformarlos en oportunidades de negocio. Toma decisiones inteligentemente. Aprenderás sobra Looker Studio, SQL y más.',
        "icon": '<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4" />
          </svg>',
        "syllabus": "https://drive.google.com/file/d/1kBzHaX9vggS6Cwfw5Mba5RDeCmck0XlF/view",
        "link": "https://start.lewagon.com/catalog",
        "restriction": "asincrónico",
        "success": "https://learn.lewagon.com/onboarding?secure_token=710a23028e151c1eca5d19323e89b04c",
      }
    ]

    currencies = { "ars": 1000, "clp": 900, "mxn": 16, "pen": 4 }
    preference_datas = {}

    currencies.each do |currency, value|
      preference_datas[currency] = {}
      short_courses = @async + @courses
      short_courses.each do |course|
        preference_datas[currency][course[:name]] =
          {
            items: [{
              id: "#{currency}-#{course[:name]}",
              title: course[:name],
              currency_id: currency.upcase,
              picture_url: "https://www.mercadopago.com/org-img/MP3/home/logomp3.gif",
              description: course[:description],
              category_id: "art",
              quantity: 1,
              unit_price: course[:price] * value.to_f
            }],
            back_urls: {
              success: course[:success],
              failure: "/failure.html",
            },
            expires: true,
            expiration_date_from: "2023-02-01T12:00:00.000-04:00",
            expiration_date_to: "2026-02-28T12:00:00.000-04:00"
          }
      end
    end

    access_token = {
      "ars": "APP_USR-8187849894420733-091811-9c117aab94ddb18c41dc7ea446d5417e-1994986217",
      "clp": "APP_USR-8187849894420733-091811-9c117aab94ddb18c41dc7ea446d5417e-1994986217",
      "pen": "APP_USR-8187849894420733-091811-9c117aab94ddb18c41dc7ea446d5417e-1994986217",
      "mxn": "APP_USR-8187849894420733-091811-9c117aab94ddb18c41dc7ea446d5417e-1994986217"
    }
    @preference_ids_per_country = {}

    currencies.each do |currency, value|
      @preference_ids_per_country[currency] = {}
      preference_datas[currency].each do |course, data|
        sdk = Mercadopago::SDK.new(access_token[currency])

        preference_response = sdk.preference.create(data)
        preference = preference_response[:response]

        @preference_ids_per_country[currency][course] = preference['id']
      end
    end
  end
end
