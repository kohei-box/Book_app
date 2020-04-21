FactoryBot.define do
  factory :book do
    googlebooksapi_id {"ooDXyAEACAAJ"}
    title {"夏目友人帳 10"}
    author {"緑川ゆき"}
    image {"http://books.google.com/books/content?id=syZ-DwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"}
    page_count { 192 }
    category { 1 }
    
  end
end
