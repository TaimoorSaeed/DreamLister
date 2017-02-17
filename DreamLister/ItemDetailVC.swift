//
//  ItemDetailVC.swift
//  DreamLister
//
//  Created by Nano Degree on 16/02/2017.
//  Copyright © 2017 Swift Pakistan. All rights reserved.

import UIKit
import CoreData

class ItemDetailVC: UIViewController, UIPickerViewDelegate , UIPickerViewDataSource {

    
    @IBOutlet weak var storePicker : UIPickerView!
    @IBOutlet weak var titleFeild : CustomTextField!
    @IBOutlet weak var PriceFeild : CustomTextField!
    @IBOutlet weak var detailsField : CustomTextField!
    
    
    var stores = [Store]()
    var itemToEdit : Item?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil , action: nil)
        }
        
        storePicker.delegate = self
        storePicker.dataSource = self
        
        
        let store = Store(context: context)
        store.name = "Best Buy"
        let store2 = Store(context: context)
        store2.name = "Tesla Dealarship"
        let store3 = Store(context: context)
        store3.name = "Fry Electonics"
        let store4 = Store(context: context)
        store4.name = "Target"
        let store5 = Store(context: context)
        store5.name = "Amazon"
        let store6 = Store(context: context)
        store6.name = "K Mart"

        ad.saveContext()
        getStores()
        
        if itemToEdit != nil {
        
            loadItemData()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //update when selected
    }
    
    func getStores() {
        
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
            
        } catch {
            
            // handle the error
        }
        
    }
    
    
    @IBAction func savePressed(_ sender: UIButton) {
        
//        let item = Item(context: context)
        
        var item: Item!
        
        if itemToEdit == nil {
         
            item = Item(context: context)
            
        } else {
            item = itemToEdit
        }
        
        if let title = titleFeild.text {
            
            item.title = title
            NSLog(item.title!)
        }
        
        if let price = PriceFeild.text {
            
            item.price = (price as NSString).doubleValue
        }
        
        if let details = detailsField.text {
            
            item.detail = details
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    func loadItemData(){
        if let item = itemToEdit {
            
            titleFeild.text = item.title
            PriceFeild.text = "\(item.price)"
            detailsField.text = item.detail
            
            if let store = item.toStore{
                
                var index = 0
                repeat {
                    let s = stores[index]
                    if s.name == store.name {
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                    
                    index += 1
                    
                }while (index < stores.count)
            }
        }
    }
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
}
