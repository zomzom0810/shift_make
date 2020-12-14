class  Position < ActiveHash::Base
    self.data = [
      { id: 1, name: '--' },
      { id: 2, name: '店長' },
      { id: 3, name: '社員' },
      { id: 4, name: 'パート' },
      { id: 5, name: 'アルバイト' },
      { id: 6, name: 'その他' }
    ]
   
    include ActiveHash::Associations
     has_many :users
    end
