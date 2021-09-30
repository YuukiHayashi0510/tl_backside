# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

    Lecture.create(:name => '力学A', :teacher => '橋本正章', :grade => '1年次', :term => '前期')
    Lecture.create(:name => '力学B', :teacher => '橋本正章', :grade => '1年次', :term => '後期')
    Lecture.create(:name => '力学C TL', :teacher => '原一広', :grade => '2年次', :term => '前期')
    Lecture.create(:name => '電子情報工学特論', :teacher => '鶴田直之', :grade => '1年次', :term => '前期')
    Lecture.create(:name => '計算機工学Ⅰ', :teacher => '佐藤寿倫', :grade => '2年次', :term => '前期')