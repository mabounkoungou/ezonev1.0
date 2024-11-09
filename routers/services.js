const express = require('express');
const {mySqlQury} = require('../middelwer/db');
const router = express.Router();
const auth = require('../middelwer/auth');
const {upload, file_upload} = require('../middelwer/multer');
const access = require('../middelwer/access');
var Excel = require('exceljs');
const fs = require('fs');
const { parse } = require('fast-csv');
const path = require('path');
const csvParser = require('csv-parser');

// <<<<<<<<<<<<<<<<<<<SERVICE LIST ALL CRUD ROUTER>>>>>>>>>>>>>>>>>>>>>>

router.get('/list', auth, async(req, res)=>{
    try {const {id,roll,store,loginas} = req.user;
    const accessdata = await access (req.user)
            if(loginas == 0){ req.flash("error", "Your Are Not Authorized For this");
            return res.redirect('back')}

        const rolldetail = await mySqlQury("select id,roll,service from tbl_roll where id = "+roll+"");
        if(rolldetail[0].roll === "master_Admin"){

            const multiy = await mySqlQury("SELECT type FROM tbl_master_shop");
            if(multiy[0].type == 1){
                var qury = "SELECT tbl_services.*,(SELECT GROUP_CONCAT(`services_type`) from `tbl_services_type` WHERE find_in_set(tbl_services_type.id,tbl_services.services_type_id)) as serviceType, tbl_store.name as store FROM tbl_services join tbl_store on tbl_services.store_ID=tbl_store.id"
                var ismulty = true
            }else{
                var qury = "SELECT tbl_services.*,(SELECT GROUP_CONCAT(`services_type`) from `tbl_services_type` WHERE find_in_set(tbl_services_type.id,tbl_services.services_type_id)) as serviceType, tbl_store.name as store FROM tbl_services join tbl_store on tbl_services.store_ID=tbl_store.id WHERE store_ID=1 "
                var ismulty = false
            }


            const servicesdata = await mySqlQury(qury)
            res.render('service',{servicesdata:servicesdata, ismulty,accessdata, language:req.language_data, language_name:req.language_name})
        }else if(rolldetail[0].service.includes('read')){
            const servicesdata = await mySqlQury("SELECT tbl_services.*,(SELECT GROUP_CONCAT(`services_type`) from `tbl_services_type` WHERE find_in_set(tbl_services_type.id,tbl_services.services_type_id)) as serviceType FROM tbl_services WHERE store_ID="+store+"")
            res.render('service',{servicesdata:servicesdata,ismulty:false ,accessdata, language:req.language_data, language_name:req.language_name})
        }else{
            req.flash("error", "Your Are Not Authorized For this");
             return res.redirect('back')
        }   
    } catch (error) {
        console.log(error);
    }
});

router.get('/addservice', auth, async(req, res)=>{
    
    try {const {id,roll,store} = req.user;
    const accessdata = await access (req.user)
        const rolldetail = await mySqlQury("select id,roll,service from tbl_roll where id = "+roll+"");
       

        if(rolldetail[0].roll === "master_Admin" ){
            const multiy = await mySqlQury("SELECT type FROM tbl_master_shop");
            if(multiy[0].type == 1){
                var ismulty=true
                var storeList = await mySqlQury("SELECT id,name FROM tbl_store WHERE status=1 AND delete_flage=0");
               
            }else{
                var ismulty=false
                var storeList = []
            }

        }else if( rolldetail[0].service.includes('write')){
               var ismulty=false
               var storeList = []

        }else{
            req.flash("error", "Your Are Not Authorized For this");
             return res.redirect('back')
        }

        res.render('add_service',{ismulty, storeList,accessdata, language:req.language_data, language_name:req.language_name})
        
    } catch (error) {
        console.log(error);
    }
});


router.post('/addservice', auth, upload.single('image'), async(req, res)=>{
    req.flash("error", "For Demo purpose all  Insert/Update/Delete are DISABLED !!");
    return res.redirect('back')
    try {const {id,roll,store} = req.user;
        const rolldetail = await mySqlQury("select id,roll,service from tbl_roll where id = "+roll+"");
        if(rolldetail[0].roll === "master_Admin" || rolldetail[0].service.includes('write')){

                var img = req.file.filename
            
                var {name,service_type,service_price,active,storeid }=req.body;
                service_type ? (Array.isArray(service_type) ? service_type=service_type.join(','):service_type):(service_type='')
                service_price ? (Array.isArray(service_price) ? service_price=service_price.join(','):service_price):(service_price=0)
                active ? active = 0 : active = 1
                storeid ? storeid : storeid=store
                var qury = "INSERT INTO tbl_services (name,image,services_type_id,services_type_price,store_ID,status) VALUE ('"+name+"','"+img+"','"+service_type+"','"+service_price+"','"+storeid+"','"+active+"')"
        
        const newservtype = await mySqlQury(qury);
        req.flash("success", "New Services Type Added!");
        res.redirect('back')


        }else{
            req.flash("error", "Your Are Not Authorized For this");
             return res.redirect('back')
        }
        
    } catch (error) {
        console.log(error);
    }
});
router.get('/deletservices/:id', auth, async(req, res)=>{
    req.flash("error", "For Demo purpose all  Insert/Update/Delete are DISABLED !!");
    return res.redirect('back')
    try {const {id,roll,store} = req.user;
        const rolldetail = await mySqlQury("select id,roll,service from tbl_roll where id = "+roll+"");
        if(rolldetail[0].roll === "master_Admin" || rolldetail[0].service.includes('delete')){

        var dataid = req.params.id
        const newservtype = await mySqlQury("DELETE FROM tbl_services WHERE id="+dataid+"");
        req.flash("success", "Services Deleted");
        res.redirect('back')


        }else{
            req.flash("error", "Your Are Not Authorized For this");
             return res.redirect('back')
        }
        
    } catch (error) {
        console.log(error);
    }
});
router.get('/updateService/:id', auth, async(req, res)=>{
    try {const {id,roll,store} = req.user;
    const accessdata = await access (req.user)
    const rolldetail = await mySqlQury("select id,roll,service from tbl_roll where id = "+roll+"");
    if(rolldetail[0].roll === "master_Admin" || rolldetail[0].service.includes('edit')){
        var dataid = req.params.id;
        const servicesdata = await mySqlQury("SELECT * FROM tbl_services WHERE id="+dataid+"")     
        var servicestypedata = await mySqlQury("SELECT * FROM tbl_services_type WHERE status=0 AND store_ID="+servicesdata[0].store_ID+"")
         console.log(2222222222, servicesdata);
         console.log(333333333, servicestypedata);

        const typeID = servicesdata[0].services_type_id.split(',');
        console.log(444444444, typeID);
        const price = servicesdata[0].services_type_price.split(',');
        console.log(5555555555, price);
   
        res.render('edit_service',{services:servicesdata[0],typedata:servicestypedata, type:typeID, price:price,accessdata, language:req.language_data, language_name:req.language_name})
    }else{
        req.flash("error", "Your Are Not Authorized For this");
         return res.redirect('back')
    }
        
    } catch (error) {
        console.log(error);
    }
});

router.post('/updateservices/:id', auth,upload.single('image_update'), async(req, res)=>{
    req.flash("error", "For Demo purpose all  Insert/Update/Delete are DISABLED !!");
    return res.redirect('back')
    try {const {id,roll,store} = req.user;
        const rolldetail = await mySqlQury("select id,roll,service from tbl_roll where id = "+roll+"");
        if(rolldetail[0].roll === "master_Admin" || rolldetail[0].service.includes('edit')){
           
           if(req.file){
            var img = req.file.filename;
            const newdata = await mySqlQury("UPDATE tbl_services SET image='"+img+"'  WHERE id = "+req.params.id+"");
           }
            
             
            var {name_update,service_type,service_price,active_update}=req.body;
            service_type ? (Array.isArray(service_type) ? service_type=service_type.join(','):service_type):(service_type='')
            service_price ? (Array.isArray(service_price) ? service_price=service_price.join(','):service_price):(service_price=0)
            active_update ? active_update = 0 : active_update = 1
            var qury = `UPDATE tbl_services SET name='${name_update}',services_type_id='${service_type}',
            services_type_price='${service_price}',status='${active_update}' WHERE id = ${req.params.id}`

            const newservtype = await mySqlQury(qury);
            req.flash("success", "Services Updated");
            res.redirect('/services/list')
       
        }else{
            req.flash("error", "Your Are Not Authorized For this");
             return res.redirect('back')
        }
        
    } catch (error) {
        console.log(error);
    }
});








// >>>>>>>>>>>>SERVICES TYPE ALL CRUD ROUTER>>>>>>>>>>>>>>>>>>

router.get('/type', auth, async(req, res)=>{
    try {const {id,roll,store,loginas} = req.user;
        const accessdata = await access (req.user)
        const storeList = await mySqlQury("SELECT id,name FROM tbl_store WHERE status=1 AND delete_flage=0");
        const multiy = await mySqlQury("SELECT type FROM tbl_master_shop");
        if(multiy[0].type == 1){var ismulty = true}else{var ismulty = false}

        if(loginas == 0){ req.flash("error", "Your Are Not Authorized For this");
        return res.redirect('back')}


        const rolldetail = await mySqlQury("select id,roll,service from tbl_roll where id = "+roll+"");
        if(rolldetail[0].roll === "master_Admin"){
            const servicestypedata = await mySqlQury("SELECT tbl_services_type.*,tbl_store.name as store FROM tbl_services_type join tbl_store on tbl_services_type.store_ID=tbl_store.id")
            res.render('service_type',{servicesTypeList:servicestypedata, ismulty ,storeList,accessdata, language:req.language_data, language_name:req.language_name})
        }else if(rolldetail[0].service.includes('read')){
            const servicestypedata = await mySqlQury("SELECT * FROM tbl_services_type WHERE store_ID="+store+"")
            res.render('service_type',{servicesTypeList:servicestypedata, ismulty:false ,storeList:[],accessdata, language:req.language_data, language_name:req.language_name})
        }else{
            req.flash("error", "Your Are Not Authorized For this");
             return res.redirect('back')
        }
        
    } catch (error) {
        console.log(error);
    }
})

router.post('/addtype', auth, async(req, res)=>{
    req.flash("error", "For Demo purpose all  Insert/Update/Delete are DISABLED !!");
    return res.redirect('back')
    try {const {id,roll,store,loginas} = req.user;

    if(loginas == 0){ req.flash("error", "Your Are Not Authorized For this");
            return res.redirect('back')}

        const rolldetail = await mySqlQury("select id,roll,service from tbl_roll where id = "+roll+"");
        if(rolldetail[0].roll === "master_Admin" || rolldetail[0].service.includes('write')){

         var {service_name,active, storeid} = req.body;
        active ? active = 0 : active = 1
        storeid ? storeid : storeid=store

        var qury = "INSERT INTO tbl_services_type (services_type,status,store_ID) VALUE ('"+service_name+"', "+active+","+storeid+")"
        const newservtype = await mySqlQury(qury);
        req.flash("success", "New Services Type Added!");
        res.redirect('back')


        }else{
            req.flash("error", "Your Are Not Authorized For this");
             return res.redirect('back')
        }
        
    } catch (error) {
        console.log(error);
    }
})

router.get('/deletservicestype/:id', auth, async(req, res)=>{
    req.flash("error", "For Demo purpose all  Insert/Update/Delete are DISABLED !!");
    return res.redirect('back')
    try {const {id,roll,store,loginas} = req.user;

        if(loginas == 0){ req.flash("error", "Your Are Not Authorized For this");
            return res.redirect('back')}

        const rolldetail = await mySqlQury("select id,roll,service from tbl_roll where id = "+roll+"");
        if(rolldetail[0].roll === "master_Admin" || rolldetail[0].service.includes('delete')){

        var dataid = req.params.id
        const newservtype = await mySqlQury("DELETE FROM tbl_services_type WHERE id="+dataid+"");
        req.flash("success", "Services Type Deleted");
        res.redirect('back')


        }else{
            req.flash("error", "Your Are Not Authorized For this");
             return res.redirect('back')
        }
        
    } catch (error) {
        console.log(error);
    }
})

router.post('/updateservicestype/:id', auth, async(req, res)=>{
    req.flash("error", "For Demo purpose all  Insert/Update/Delete are DISABLED !!");
    return res.redirect('back')
    try {const {id,roll,store,loginas} = req.user;

        if(loginas == 0){ req.flash("error", "Your Are Not Authorized For this");
            return res.redirect('back')}

        const rolldetail = await mySqlQury("select id,roll,service from tbl_roll where id = "+roll+"");
        if(rolldetail[0].roll === "master_Admin" || rolldetail[0].service.includes('edit')){
            var {service_name,active} = req.body;
            var dataid = req.params.id
            active ? active = 0 : active = 1

            const newservtype = await mySqlQury("UPDATE tbl_services_type SET services_type='"+service_name+"', status="+active+" WHERE id="+dataid+"");
       
            req.flash("success", "Services Type Updated");
            res.redirect('back')


        }else{
            req.flash("error", "Your Are Not Authorized For this");
             return res.redirect('back')
        }
        
    } catch (error) {
        console.log(error);
    }
})

router.get('/typelist/:id',auth, async (req, res)=>{
    try {const {id,roll,store} = req.user;
    const rolldetail = await mySqlQury("select id,roll,service from tbl_roll where id = "+roll+"");


    if(rolldetail[0].roll === "master_Admin"){
        const multiy = await mySqlQury("SELECT type FROM tbl_master_shop");
            if(multiy[0].type == 1){
                var dataid = req.params.id
                const servicestypedata = await mySqlQury("SELECT * FROM tbl_services_type WHERE status=0 AND store_ID="+dataid+" ")
                return res.status(200).json({data:servicestypedata})
               
            }else{
                const servicestypedata = await mySqlQury("SELECT * FROM tbl_services_type WHERE status=0 AND store_ID=1 ")
                return res.status(200).json({data:servicestypedata})
            }

    }else if(rolldetail[0].service.includes('write')){

        const servicestypedata = await mySqlQury("SELECT * FROM tbl_services_type WHERE status=0 AND store_ID="+store+"")
        res.status(200).json({data:servicestypedata})


    }else{
        req.flash("error", "Your Are Not Authorized For this");
         return res.redirect('back')
    }
    
        
    } catch (error) {
        console.log(error);
    }
})






// >>>>>>>>>>>>>>>>>ADD ONS SERVICES ROUTERS <<<<<<<<<<<<<<<<<<<<

router.get('/addon', auth, async(req, res)=>{
    try {const {id,roll,store,loginas} = req.user;
    const accessdata = await access (req.user)
        const multiy = await mySqlQury("SELECT type FROM tbl_master_shop");
        if(multiy[0].type == 1){var ismulty = true}else{var ismulty = false}

        if(loginas == 0){ req.flash("error", "Your Are Not Authorized For this");
        return res.redirect('back')}

        const storeList = await mySqlQury("SELECT id,name FROM tbl_store WHERE status=1 AND delete_flage=0");

        const rolldetail = await mySqlQury("select id,roll,service from tbl_roll where id = "+roll+"");
        if(rolldetail[0].roll === "master_Admin"){
            const addondata = await mySqlQury("SELECT tbl_addons.*,tbl_store.name as store FROM tbl_addons join tbl_store on tbl_addons.store_ID=tbl_store.id")
            res.render('addons',{addonList:addondata, ismulty,storeList,accessdata, language:req.language_data, language_name:req.language_name})
        }else if(rolldetail[0].service.includes('read')){
            const addondata = await mySqlQury("SELECT * FROM tbl_addons WHERE store_ID="+store+"")
            res.render('addons',{addonList:addondata,ismulty:false, storeList:[],accessdata, language:req.language_data, language_name:req.language_name})
        }else{
            req.flash("error", "Your Are Not Authorized For this");
             return res.redirect('back')
        }   
    } catch (error) {
        console.log(error);
    }
})

router.post('/addaddon', auth, async(req, res)=>{
    req.flash("error", "For Demo purpose all  Insert/Update/Delete are DISABLED !!");
    return res.redirect('back')
    try {const {id,roll,store,loginas} = req.user;

        if(loginas == 0){ req.flash("error", "Your Are Not Authorized For this");
        return res.redirect('back')}
        const rolldetail = await mySqlQury("select id,roll,service from tbl_roll where id = "+roll+"");
        if(rolldetail[0].roll === "master_Admin" || rolldetail[0].service.includes('write')){

            var{ addon_name, addon_price, active, storeid } = req.body;
            active ? active = 0 : active = 1
           
            storeid ? storeid : storeid=store

            var qury = "INSERT INTO tbl_addons (addon,price,status,store_ID) VALUE ('"+addon_name+"', "+addon_price+", "+active+", "+storeid+")"
            const newaddons = await mySqlQury(qury);
            req.flash("success", "New ADDONS Added!");
            res.redirect('back')


        }else{
            req.flash("error", "Your Are Not Authorized For this");
             return res.redirect('back')
        }
        
    } catch (error) {
        console.log(error);
    }
})

router.get('/deletaddon/:id', auth, async(req, res)=>{
    req.flash("error", "For Demo purpose all  Insert/Update/Delete are DISABLED !!");
    return res.redirect('back')
    try {const {id,roll,store,loginas} = req.user;

            if(loginas == 0){ req.flash("error", "Your Are Not Authorized For this");
            return res.redirect('back')}
        const rolldetail = await mySqlQury("select id,roll,service from tbl_roll where id = "+roll+"");
        if(rolldetail[0].roll === "master_Admin" || rolldetail[0].service.includes('delete')){

        var dataid = req.params.id

      
        const newaddons = await mySqlQury("DELETE FROM tbl_addons WHERE id="+dataid+"");
        req.flash("success", "Addons Deleted");
        res.redirect('back')


        }else{
            req.flash("error", "Your Are Not Authorized For this");
             return res.redirect('back')
        }
        
    } catch (error) {
        console.log(error);
    }
})

router.post('/updateaddon/:id', auth, async(req, res)=>{
    req.flash("error", "For Demo purpose all  Insert/Update/Delete are DISABLED !!");
    return res.redirect('back')
    try {const {id,roll,store,loginas} = req.user;

            if(loginas == 0){ req.flash("error", "Your Are Not Authorized For this");
            return res.redirect('back')}

        const rolldetail = await mySqlQury("select id,roll,service from tbl_roll where id = "+roll+"");
        if(rolldetail[0].roll === "master_Admin" || rolldetail[0].service.includes('edit')){
            var{ addon_name_update, addon_price_update, active_update } = req.body;
            active_update ? active_update = 0 : active_update = 1

            var qury = "UPDATE tbl_addons SET addon='"+addon_name_update+"',price="+addon_price_update+",status="+active_update+" WHERE id ="+req.params.id+" "
            const newaddons = await mySqlQury(qury);
           
       
            req.flash("success", "Addons Updated");
            res.redirect('back')


        }else{
            req.flash("error", "Your Are Not Authorized For this");
             return res.redirect('back')
        }
        
    } catch (error) {
        console.log(error);
    }
})




router.get('/csv_file', auth, async(req, res) => {
    try {
        const {id,roll,store,loginas} = req.user;
        const accessdata = await access (req.user)

        res.render('add_csv', {accessdata, language:req.language_data, language_name:req.language_name})
    } catch (error) {
        console.log(error);
    }
})

router.get('/demo_csv', auth, async(req, res) => {
    try {
        const accessdata = await access (req.user)
        let workbook = new Excel.Workbook();
        let worksheet = workbook.addWorksheet("Service_list");

        if (accessdata.topbardata.id == '1') {
            
            worksheet.columns = [
                { header: 'name', key: 'name', width: 25},
                { header: 'image', key: 'image', width: 35},
                { header: 'services_type_id', key: 'services_type_id', width: 25},
                { header: 'services_type_price', key: 'services_type_price', width: 25},
                { header: 'store_ID', key: 'store_ID', width: 25},
            ];
        } else {
            
            worksheet.columns = [
                { header: 'name', key: 'name', width: 25},
                { header: 'image', key: 'image', width: 35},
                { header: 'services_type_id', key: 'services_type_id', width: 25},
                { header: 'services_type_price', key: 'services_type_price', width: 25},
            ];
        }

        res.setHeader(
            "Content-Type",
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        );
        res.setHeader(
            "Content-Disposition",
            "attachment; filename=" + "Service_list.csv"
        );
        return workbook.csv.write(res).then(function () {
            res.status(200).end
        });
    } catch (error) {
        console.log(error);
    }
})

router.post('/add_csv', auth, file_upload.single('csv_file'), async(req, res) => {
    req.flash("error", "For Demo purpose all  Insert/Update/Delete are DISABLED !!");
    return res.redirect('back')
    try {
        const accessdata = await access (req.user)
        var filename = path.join( __dirname,  "../public/uploads/" + req.file.filename)
        

        fs.createReadStream(filename).pipe(parse({ headers: true }))
        .on('error', (error) => {
            console.error(error)
            req.flash("error", "Issue with uploaded file");
            return res.render('add_csv', {accessdata, language:req.language_data, language_name:req.language_name, error : req.flash("error")});
        })
        .on('data', async(row) => {
            if (accessdata.topbardata.id == '1') {
                if (row.store_ID == undefined) {
                    req.flash("error", "Issue with uploaded file");
                    return res.render('add_csv', {accessdata, language:req.language_data, language_name:req.language_name, error : req.flash("error")});
                }else if (row.name != "" && row.image != "" && row.services_type_id != "" && row.services_type_price != "" && row.store_ID != "") {
                    console.log(row);
                    const data_split = row.services_type_id.split(',')
                    console.log('data_split', data_split);
    
                    const results = await mySqlQury(`SELECT COUNT(*) AS count FROM tbl_services_type WHERE id IN (${data_split})`)
                    const count = results[0].count;
    
                    if (data_split.length == count) {
                        await mySqlQury(`INSERT INTO tbl_services (name, image, services_type_id, services_type_price, store_ID) VALUE 
                        ('${row.name}', '${row.image}', '${row.services_type_id}', '${row.services_type_price}', '${row.store_ID}')`)
                    }

                    req.flash("success", "Successfully Uploaded");
                    return res.render('add_csv', {accessdata, language:req.language_data, language_name:req.language_name, success : req.flash("success")});
                }
            } else {
                if (row.store_ID) {
                    req.flash("error", "Issue with uploaded file");
                    return res.render('add_csv', {accessdata, language:req.language_data, language_name:req.language_name, error : req.flash("error")});
                }
                if (row.name != "" && row.image != "" && row.services_type_id != "" && row.services_type_price != "") {
                    console.log(row);
                    const data_split = row.services_type_id.split(',')
                    console.log('data_split', data_split);
    
                    const results = await mySqlQury(`SELECT COUNT(*) AS count FROM tbl_services_type WHERE id IN (${data_split})`)
                    const count = results[0].count;
    
                    if (data_split.length == count) {
                        await mySqlQury(`INSERT INTO tbl_services (name, image, services_type_id, services_type_price, store_ID) VALUE 
                        ('${row.name}', '${row.image}', '${row.services_type_id}', '${row.services_type_price}', '${accessdata.topbardata.id}')`)
                    }

                    req.flash("success", "Successfully Uploaded");
                    return res.render('add_csv', {accessdata, language:req.language_data, language_name:req.language_name, success : req.flash("success")});
                }
            }
        })
    } catch (error) {
        console.log(44444, error);
    }
})





module.exports=router