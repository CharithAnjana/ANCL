﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CLibrary.Common;

namespace CLibrary.Domain {
    public class PrCapexDoc {
        [DBField("FILE_ID")]
        public int FileId { get; set; }
        [DBField("PR_ID")]
        public int PrId { get; set; }
        [DBField("FILE_NAME")]
        public string FileName { get; set; }
        [DBField("FILE_PATH")]
        public string FilePath { get; set; }
        [DBField("FILE_DATA")]
        public string FileData { get; set; }

        /// <summary>
        /// 0 = Do Nothing,
        /// 1 = Insert,
        /// 2 = Update,
        /// 3 = Delete
        /// </summary>
        public int Todo { get; set; }
    }
}
