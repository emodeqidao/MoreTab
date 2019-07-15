//
//  XMenuView.m
//  MoreTab
//
//  Created by xixi on 2019/7/15.
//  Copyright © 2019 xixi. All rights reserved.
//

#import "XMenuView.h"

@interface XMenuItemCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *line;
@end

@implementation XMenuItemCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.titleLabel.font = [UIFont systemFontOfSize:15.f];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];
        
        self.line = [[UILabel alloc] init];
        self.line.frame = CGRectMake(0, frame.size.height - 1.f, frame.size.width, 1.f);
        [self.contentView addSubview:self.line];
    }
    return self;
}

-(void)setSelected:(BOOL)selected
{
    if (selected)
    {
        self.line.backgroundColor = [UIColor yellowColor];
    }
    else
    {
        self.line.backgroundColor = [UIColor clearColor];
    }
}

@end

@interface XMenuView()
<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign) CGFloat collectionHeight;

@property (nonatomic, assign) CGFloat sectionInsetTop;
@property (nonatomic, assign) CGFloat sectionInsetLeft;
@property (nonatomic, assign) CGFloat sectionInsetBottom;
@property (nonatomic, assign) CGFloat sectionInsetRight;

//上下行间距
@property (nonatomic, assign) CGFloat minimumLineSpacing;
//左右列间距
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;

@end

@implementation XMenuView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.collectionHeight = frame.size.height;
        self.sectionInsetTop = 0;
        self.sectionInsetLeft = 5.f;
        self.sectionInsetRight = 5.f;
        self.sectionInsetBottom = 0;
        self.minimumLineSpacing = 5.f;
        self.minimumInteritemSpacing = 5.f;
        
        [self addSubview:self.collectionView];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:didSelectItemAtIndexPath:)])
//            {
            [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
//                [self.collectionView.delegate collectionView:self.collectionView didSelectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
//            }
        });
    }
    return self;
}

-(UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = self.minimumLineSpacing;
        flowLayout.minimumInteritemSpacing = self.minimumInteritemSpacing;
        flowLayout.sectionInset = UIEdgeInsetsMake(self.sectionInsetTop, self.sectionInsetLeft, self.sectionInsetBottom, self.sectionInsetRight);
        flowLayout.itemSize = CGSizeMake(50.f, self.collectionHeight);
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, self.collectionHeight) collectionViewLayout:flowLayout];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.alwaysBounceVertical = YES;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.collectionView];
        
        [self.collectionView registerClass:[XMenuItemCell class] forCellWithReuseIdentifier:@"xixi"];
        
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FootView"];
    }
    return _collectionView;
}

#pragma mark
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XMenuItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"xixi" forIndexPath:indexPath];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%zd", indexPath.item];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}


@end
