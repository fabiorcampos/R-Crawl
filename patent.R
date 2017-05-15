library(xml2)
library(RODBC)
drv <- odbcConnect("ODBC設定名稱",uid = "帳號", pwd = "密碼")
TargetTable<-"patentSymantec"

patent = sqlQuery(drv, paste0(" select *   FROM [Farmdata].[dbo].[",TargetTable,"] where len(cpc)<10 "), stringsAsFactors = FALSE)
for (x in c(1:length(patent$patentNo) )){
  tryCatch({
    #message("x=",patent$patentNo[x])
    patent.url<-patent$url[x]
    #message("A=")
    cpc<-""
    doc <- read_html(patent.url)
    #message("B=")
    title<-xml_text(xml_find_all(doc, "//table[2]//tr[1]//td[2]"))
    
    abstract<-xml_text(xml_find_all(doc, "//p[1]"))
    cpc4<-xml_text(xml_find_all(doc, "//table[4]//tr[2]//td[2]"))
    #message("cpc4=",cpc4)
    cpc5<-xml_text(xml_find_all(doc, "//table[5]//tr[2]//td[2]"))
    #message("cpc5=",cpc5)
    cpc6<-xml_text(xml_find_all(doc, "//table[6]//tr[2]//td[2]"))
    #message("cpc6=",cpc6)
    cpc7<-xml_text(xml_find_all(doc, "//table[7]//tr[2]//td[2]"))
    # message("cpc7=",cpc7)
    if(length(cpc4)>0&&nchar(cpc4)>20){  cpc<-cpc4  }
    else if(length(cpc5)>0&&nchar(cpc5)>20){cpc<-cpc5  }
    else if(length(cpc6)>0&&nchar(cpc6)>20){cpc<-cpc6 }
    else if(length(cpc7)>0&&nchar(cpc7)>20){cpc<-cpc7  }
    #  message("cpc=",cpc)
    
    claims<-xml_text(xml_find_all(doc, "//coma[1]"))
    claimsdes<-strsplit(claims,split="BRIEF DESCRIPTION OF THE DRAWINGS",fixed=T)
    claimsanddes<-strsplit(claimsdes[[1]][1],split="Description",fixed=T)
    claimsspdes<-strsplit(claimsanddes[[1]][1],split="Claims",fixed=T)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [title]='",gsub("'","",title) ,"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [abstract]='",gsub("'","",abstract) ,"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [cpc]='",gsub("'","", cpc),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [claimsinner]='",gsub("'","",claimsspdes[[1]][2]),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [des]='",gsub("'","",claimsanddes[[1]][2]),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    
    message("Z=",patent$patentNo[x])
  },
  error=function(cond) {
    
  })
}

TargetTable<-"patentAvast"

patent = sqlQuery(drv, paste0(" select *   FROM [Farmdata].[dbo].[",TargetTable,"] where len(cpc)<10 "), stringsAsFactors = FALSE)
for (x in c(1:length(patent$patentNo) )){
  tryCatch({
    #message("x=",patent$patentNo[x])
    patent.url<-patent$url[x]
    #message("A=")
    cpc<-""
    doc <- read_html(patent.url)
    #message("B=")
    title<-xml_text(xml_find_all(doc, "//table[2]//tr[1]//td[2]"))
    
    abstract<-xml_text(xml_find_all(doc, "//p[1]"))
    cpc4<-xml_text(xml_find_all(doc, "//table[4]//tr[2]//td[2]"))
    #message("cpc4=",cpc4)
    cpc5<-xml_text(xml_find_all(doc, "//table[5]//tr[2]//td[2]"))
    #message("cpc5=",cpc5)
    cpc6<-xml_text(xml_find_all(doc, "//table[6]//tr[2]//td[2]"))
    #message("cpc6=",cpc6)
    cpc7<-xml_text(xml_find_all(doc, "//table[7]//tr[2]//td[2]"))
    # message("cpc7=",cpc7)
    if(length(cpc4)>0&&nchar(cpc4)>20){  cpc<-cpc4  }
    else if(length(cpc5)>0&&nchar(cpc5)>20){cpc<-cpc5  }
    else if(length(cpc6)>0&&nchar(cpc6)>20){cpc<-cpc6 }
    else if(length(cpc7)>0&&nchar(cpc7)>20){cpc<-cpc7  }
    #  message("cpc=",cpc)
    
    claims<-xml_text(xml_find_all(doc, "//coma[1]"))
    claimsdes<-strsplit(claims,split="BRIEF DESCRIPTION OF THE DRAWINGS",fixed=T)
    claimsanddes<-strsplit(claimsdes[[1]][1],split="Description",fixed=T)
    claimsspdes<-strsplit(claimsanddes[[1]][1],split="Claims",fixed=T)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [title]='",gsub("'","",title) ,"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [abstract]='",gsub("'","",abstract) ,"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [cpc]='",gsub("'","", cpc),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [claimsinner]='",gsub("'","",claimsspdes[[1]][2]),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [des]='",gsub("'","",claimsanddes[[1]][2]),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    
    message("Z=",patent$patentNo[x])
  },
  error=function(cond) {
    
  })
}

TargetTable<-"patentAvira"

patent = sqlQuery(drv, paste0(" select *   FROM [Farmdata].[dbo].[",TargetTable,"] where len(cpc)<10 "), stringsAsFactors = FALSE)
for (x in c(1:length(patent$patentNo) )){
  tryCatch({
    #message("x=",patent$patentNo[x])
    patent.url<-patent$url[x]
    #message("A=")
    cpc<-""
    doc <- read_html(patent.url)
    #message("B=")
    title<-xml_text(xml_find_all(doc, "//table[2]//tr[1]//td[2]"))
    
    abstract<-xml_text(xml_find_all(doc, "//p[1]"))
    cpc4<-xml_text(xml_find_all(doc, "//table[4]//tr[2]//td[2]"))
    #message("cpc4=",cpc4)
    cpc5<-xml_text(xml_find_all(doc, "//table[5]//tr[2]//td[2]"))
    #message("cpc5=",cpc5)
    cpc6<-xml_text(xml_find_all(doc, "//table[6]//tr[2]//td[2]"))
    #message("cpc6=",cpc6)
    cpc7<-xml_text(xml_find_all(doc, "//table[7]//tr[2]//td[2]"))
    # message("cpc7=",cpc7)
    if(length(cpc4)>0&&nchar(cpc4)>20){  cpc<-cpc4  }
    else if(length(cpc5)>0&&nchar(cpc5)>20){cpc<-cpc5  }
    else if(length(cpc6)>0&&nchar(cpc6)>20){cpc<-cpc6 }
    else if(length(cpc7)>0&&nchar(cpc7)>20){cpc<-cpc7  }
    #  message("cpc=",cpc)
    
    claims<-xml_text(xml_find_all(doc, "//coma[1]"))
    claimsdes<-strsplit(claims,split="BRIEF DESCRIPTION OF THE DRAWINGS",fixed=T)
    claimsanddes<-strsplit(claimsdes[[1]][1],split="Description",fixed=T)
    claimsspdes<-strsplit(claimsanddes[[1]][1],split="Claims",fixed=T)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [title]='",gsub("'","",title) ,"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [abstract]='",gsub("'","",abstract) ,"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [cpc]='",gsub("'","", cpc),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [claimsinner]='",gsub("'","",claimsspdes[[1]][2]),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [des]='",gsub("'","",claimsanddes[[1]][2]),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    
    message("Z=",patent$patentNo[x])
  },
  error=function(cond) {
    
  })
}

TargetTable<-"patentBitdefender"

patent = sqlQuery(drv, paste0(" select *   FROM [Farmdata].[dbo].[",TargetTable,"] where len(cpc)<10 "), stringsAsFactors = FALSE)
for (x in c(1:length(patent$patentNo) )){
  tryCatch({
    #message("x=",patent$patentNo[x])
    patent.url<-patent$url[x]
    #message("A=")
    cpc<-""
    doc <- read_html(patent.url)
    #message("B=")
    title<-xml_text(xml_find_all(doc, "//table[2]//tr[1]//td[2]"))
    
    abstract<-xml_text(xml_find_all(doc, "//p[1]"))
    cpc4<-xml_text(xml_find_all(doc, "//table[4]//tr[2]//td[2]"))
    #message("cpc4=",cpc4)
    cpc5<-xml_text(xml_find_all(doc, "//table[5]//tr[2]//td[2]"))
    #message("cpc5=",cpc5)
    cpc6<-xml_text(xml_find_all(doc, "//table[6]//tr[2]//td[2]"))
    #message("cpc6=",cpc6)
    cpc7<-xml_text(xml_find_all(doc, "//table[7]//tr[2]//td[2]"))
    # message("cpc7=",cpc7)
    if(length(cpc4)>0&&nchar(cpc4)>20){  cpc<-cpc4  }
    else if(length(cpc5)>0&&nchar(cpc5)>20){cpc<-cpc5  }
    else if(length(cpc6)>0&&nchar(cpc6)>20){cpc<-cpc6 }
    else if(length(cpc7)>0&&nchar(cpc7)>20){cpc<-cpc7  }
    #  message("cpc=",cpc)
    
    claims<-xml_text(xml_find_all(doc, "//coma[1]"))
    claimsdes<-strsplit(claims,split="BRIEF DESCRIPTION OF THE DRAWINGS",fixed=T)
    claimsanddes<-strsplit(claimsdes[[1]][1],split="Description",fixed=T)
    claimsspdes<-strsplit(claimsanddes[[1]][1],split="Claims",fixed=T)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [title]='",gsub("'","",title) ,"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [abstract]='",gsub("'","",abstract) ,"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [cpc]='",gsub("'","", cpc),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [claimsinner]='",gsub("'","",claimsspdes[[1]][2]),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [des]='",gsub("'","",claimsanddes[[1]][2]),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    
    message("Z=",patent$patentNo[x])
  },
  error=function(cond) {
    
  })
}

TargetTable<-"patentFSecure"

patent = sqlQuery(drv, paste0(" select *   FROM [Farmdata].[dbo].[",TargetTable,"] where len(cpc)<10 "), stringsAsFactors = FALSE)
for (x in c(1:length(patent$patentNo) )){
  tryCatch({
    #message("x=",patent$patentNo[x])
    patent.url<-patent$url[x]
    #message("A=")
    cpc<-""
    doc <- read_html(patent.url)
    #message("B=")
    title<-xml_text(xml_find_all(doc, "//table[2]//tr[1]//td[2]"))
    
    abstract<-xml_text(xml_find_all(doc, "//p[1]"))
    cpc4<-xml_text(xml_find_all(doc, "//table[4]//tr[2]//td[2]"))
    #message("cpc4=",cpc4)
    cpc5<-xml_text(xml_find_all(doc, "//table[5]//tr[2]//td[2]"))
    #message("cpc5=",cpc5)
    cpc6<-xml_text(xml_find_all(doc, "//table[6]//tr[2]//td[2]"))
    #message("cpc6=",cpc6)
    cpc7<-xml_text(xml_find_all(doc, "//table[7]//tr[2]//td[2]"))
    # message("cpc7=",cpc7)
    if(length(cpc4)>0&&nchar(cpc4)>20){  cpc<-cpc4  }
    else if(length(cpc5)>0&&nchar(cpc5)>20){cpc<-cpc5  }
    else if(length(cpc6)>0&&nchar(cpc6)>20){cpc<-cpc6 }
    else if(length(cpc7)>0&&nchar(cpc7)>20){cpc<-cpc7  }
    #  message("cpc=",cpc)
    
    claims<-xml_text(xml_find_all(doc, "//coma[1]"))
    claimsdes<-strsplit(claims,split="BRIEF DESCRIPTION OF THE DRAWINGS",fixed=T)
    claimsanddes<-strsplit(claimsdes[[1]][1],split="Description",fixed=T)
    claimsspdes<-strsplit(claimsanddes[[1]][1],split="Claims",fixed=T)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [title]='",gsub("'","",title) ,"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [abstract]='",gsub("'","",abstract) ,"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [cpc]='",gsub("'","", cpc),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [claimsinner]='",gsub("'","",claimsspdes[[1]][2]),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [des]='",gsub("'","",claimsanddes[[1]][2]),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    
    message("Z=",patent$patentNo[x])
  },
  error=function(cond) {
    
  })
}

TargetTable<-"patentKaspersky"

patent = sqlQuery(drv, paste0(" select *   FROM [Farmdata].[dbo].[",TargetTable,"] where len(cpc)<10 "), stringsAsFactors = FALSE)
for (x in c(1:length(patent$patentNo) )){
  tryCatch({
    #message("x=",patent$patentNo[x])
    patent.url<-patent$url[x]
    #message("A=")
    cpc<-""
    doc <- read_html(patent.url)
    #message("B=")
    title<-xml_text(xml_find_all(doc, "//table[2]//tr[1]//td[2]"))
    
    abstract<-xml_text(xml_find_all(doc, "//p[1]"))
    cpc4<-xml_text(xml_find_all(doc, "//table[4]//tr[2]//td[2]"))
    #message("cpc4=",cpc4)
    cpc5<-xml_text(xml_find_all(doc, "//table[5]//tr[2]//td[2]"))
    #message("cpc5=",cpc5)
    cpc6<-xml_text(xml_find_all(doc, "//table[6]//tr[2]//td[2]"))
    #message("cpc6=",cpc6)
    cpc7<-xml_text(xml_find_all(doc, "//table[7]//tr[2]//td[2]"))
    # message("cpc7=",cpc7)
    if(length(cpc4)>0&&nchar(cpc4)>20){  cpc<-cpc4  }
    else if(length(cpc5)>0&&nchar(cpc5)>20){cpc<-cpc5  }
    else if(length(cpc6)>0&&nchar(cpc6)>20){cpc<-cpc6 }
    else if(length(cpc7)>0&&nchar(cpc7)>20){cpc<-cpc7  }
    #  message("cpc=",cpc)
    
    claims<-xml_text(xml_find_all(doc, "//coma[1]"))
    claimsdes<-strsplit(claims,split="BRIEF DESCRIPTION OF THE DRAWINGS",fixed=T)
    claimsanddes<-strsplit(claimsdes[[1]][1],split="Description",fixed=T)
    claimsspdes<-strsplit(claimsanddes[[1]][1],split="Claims",fixed=T)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [title]='",gsub("'","",title) ,"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [abstract]='",gsub("'","",abstract) ,"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [cpc]='",gsub("'","", cpc),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [claimsinner]='",gsub("'","",claimsspdes[[1]][2]),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [des]='",gsub("'","",claimsanddes[[1]][2]),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    
    message("Z=",patent$patentNo[x])
  },
  error=function(cond) {
    
  })
}

TargetTable<-"patentMcAfee"

patent = sqlQuery(drv, paste0(" select *   FROM [Farmdata].[dbo].[",TargetTable,"] where len(cpc)<10 "), stringsAsFactors = FALSE)
for (x in c(1:length(patent$patentNo) )){
  tryCatch({
    #message("x=",patent$patentNo[x])
    patent.url<-patent$url[x]
    #message("A=")
    cpc<-""
    doc <- read_html(patent.url)
    #message("B=")
    title<-xml_text(xml_find_all(doc, "//table[2]//tr[1]//td[2]"))
    
    abstract<-xml_text(xml_find_all(doc, "//p[1]"))
    cpc4<-xml_text(xml_find_all(doc, "//table[4]//tr[2]//td[2]"))
    #message("cpc4=",cpc4)
    cpc5<-xml_text(xml_find_all(doc, "//table[5]//tr[2]//td[2]"))
    #message("cpc5=",cpc5)
    cpc6<-xml_text(xml_find_all(doc, "//table[6]//tr[2]//td[2]"))
    #message("cpc6=",cpc6)
    cpc7<-xml_text(xml_find_all(doc, "//table[7]//tr[2]//td[2]"))
    # message("cpc7=",cpc7)
    if(length(cpc4)>0&&nchar(cpc4)>20){  cpc<-cpc4  }
    else if(length(cpc5)>0&&nchar(cpc5)>20){cpc<-cpc5  }
    else if(length(cpc6)>0&&nchar(cpc6)>20){cpc<-cpc6 }
    else if(length(cpc7)>0&&nchar(cpc7)>20){cpc<-cpc7  }
    #  message("cpc=",cpc)
    
    claims<-xml_text(xml_find_all(doc, "//coma[1]"))
    claimsdes<-strsplit(claims,split="BRIEF DESCRIPTION OF THE DRAWINGS",fixed=T)
    claimsanddes<-strsplit(claimsdes[[1]][1],split="Description",fixed=T)
    claimsspdes<-strsplit(claimsanddes[[1]][1],split="Claims",fixed=T)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [title]='",gsub("'","",title) ,"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [abstract]='",gsub("'","",abstract) ,"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [cpc]='",gsub("'","", cpc),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [claimsinner]='",gsub("'","",claimsspdes[[1]][2]),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    sql<-paste0("update [Farmdata].[dbo].[",TargetTable,"] set [des]='",gsub("'","",claimsanddes[[1]][2]),"' where [patentNo]='",patent$patentNo[x],"'")
    sqlQuery(drv,sql, stringsAsFactors = FALSE)
    
    message("Z=",patent$patentNo[x])
  },
  error=function(cond) {
    
  })
}
