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
      "restriction": "sincrónico"
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
      "restriction": "sincrónico"
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
      "restriction": "sincrónico"
    }
  ]

    @async = [
    {
      "name": 'UX/UI Design',
      "hours": 24,
      "price": 200,
      "description": 'Aprende a construir prototipos de productos digitales entendiendo cómo se aplican la experiencia de Usuario y el diseño de las interfaces. Aprenderás sobre Figma y Analytics.',
      "icon": '<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4" />
        </svg>',
      "syllabus": "https://drive.google.com/file/d/1kBzHaX9vggS6Cwfw5Mba5RDeCmck0XlF/view",
      "link": "https://start.lewagon.com/catalog",
      "restriction": "asincrónico"
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
      "restriction": "asincrónico"
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
      "restriction": "asincrónico"
    }
  ]

    sdk = Mercadopago::SDK.new(ENV["ACCESS_TOKEN"])

    preference_data = {
      items: [{
        id: "item-ID-1234",
        title: "Meu produto",
        currency_id: "BRL",
        picture_url: "https://www.mercadopago.com/org-img/MP3/home/logomp3.gif",
        description: "Descrição do Item",
        category_id: "art",
        quantity: 1,
        unit_price: 75.76
      }],
      payer: {
        name: "João",
        surname: "Silva",
        email: "user@email.com",
        phone: {
          area_code: "11",
          number: "4444-4444"
        },
        identification: {
          type: "CPF",
          number: "19119119100"
        },
        address: {
          street_name: "Street",
          street_number: 123,
          zip_code: "06233200"
        }
      },
      back_urls: {
        success: "https://www.success.com",
        failure: "http://www.failure.com",
        pending: "http://www.pending.com"
      },
      auto_return: "approved",
      notification_url: "https://www.your-site.com/ipn",
      statement_descriptor: "MEUNEGOCIO",
      external_reference: "Reference_1234",
      expires: true,
      expiration_date_from: "2023-02-01T12:00:00.000-04:00",
      expiration_date_to: "2025-02-28T12:00:00.000-04:00"
    }

    preference_response = sdk.preference.create(preference_data)
    preference = preference_response[:response]

    # Este valor substituirá a string "<%= @preference_id %>" no seu HTML
    @preference_id = preference['id']
  end
end
